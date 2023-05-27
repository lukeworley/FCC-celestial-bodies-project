#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games restart identity")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
#Populate teams table
# get winner
if [[ $YEAR != "year" ]]
then
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  echo $TEAM_ID
  # if not found
  if [[ -z $TEAM_ID ]]
  then 
    # insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
      echo Insert into teams, $WINNER
    fi
  fi
  # get opponent
  TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  echo $TEAM_ID_2
  # if not found
  if [[ -z $TEAM_ID_2 ]]
    then 
    # insert team
    INSERT_TEAM_RESULT_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_TEAM_RESULT_2 == "INSERT 0 1" ]]
      then
      echo Insert into teams, $OPPONENT
    fi
  fi
  #Populate games table
  #get id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')") 
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
    echo Insert into games, new game 
  fi
fi
done