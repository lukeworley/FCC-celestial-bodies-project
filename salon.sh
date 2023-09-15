#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~~ Salon ~~~~~~"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWhich service do you require?"
  echo -e "\n1) cut\n2) shave\n3) wash \n4) exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
  1) BOOKING ;;
  2) BOOKING ;;
  3) BOOKING ;;
  4) EXIT ;;
  *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

BOOKING() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_PHONE_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi
  echo -e "\nWhen do you require your service?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone = '$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  echo "I have put you down for a"$SERVICE_SELECTED" at $SERVICE_TIME, $CUSTOMER_NAME."
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU