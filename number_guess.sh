#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo Enter your username:
read USERNAME

USERNAME_EXISTING=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
if [[ -z $USERNAME_EXISTING ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo Guess the secret number between 1 and 1000:
read NUMBER
GUESS_COUNTER=1

while [[ $NUMBER != $RANDOM_NUMBER ]] 
do
  while ! [[ $NUMBER =~ [0-9]+ ]]
  do
    echo That is not an integer, guess again:
    read NUMBER
  done
  while [[ $NUMBER > $RANDOM_NUMBER ]]
  do
    echo It\'s lower than that, guess again:
    read NUMBER
    (( GUESS_COUNTER++ ))
  done
  while [[ $NUMBER < $RANDOM_NUMBER ]]
  do
    echo It\'s higher than that, guess again:
    read NUMBER
    (( GUESS_COUNTER++ ))
  done
done
echo You guessed it in $GUESS_COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!

if [[ -z $USERNAME_EXISTING ]]
then
 ADD_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $GUESS_COUNTER)")
else
  UPDATE_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")+1
  if [[ $GUESS_COUNTER < $($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'") ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $GUESS_COUNTER WHERE username = '$USERNAME'")
  fi
fi