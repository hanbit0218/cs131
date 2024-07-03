#!/bin/bash



# - confirm file's existance - #

if [ ! -f "$1" ]; then
  echo "Error: File does not exist"
  exit 1


fi



# - get cd - #

CURRENT_DATE=$(date +%Y-%m-%d-%H-%M-%S)

# - get lmd - #

LAST_MODIFIED_DATE=$(stat -c "%y" "$1")

# - print cd - #

echo "Current Date and Time: $CURRENT_DATE"

# - print lmd - #

echo "Last Modified Date: $LAST_MODIFIED_DATE"

# - prompt user - #

read -p "Do you want to change the last modified date? (y/n): " RESPONSE

if [ "$RESPONSE" = "y" ]; then
  
  # - prompt user - #

  read -p "Enter the new last modified date (YYYYMMDD): " NEW_LAST_MODIFIED_DATE

  # - convert - #

  NEW_LAST_MODIFIED_DATE=$(date -d "$NEW_LAST_MODIFIED_DATE" +%Y%m%d%H%M.%S)

  # - change - #

  touch -t "$NEW_LAST_MODIFIED_DATE" "$1"

  echo "Last Modified Date changed successfully"



else
  echo "Last Modified Date not changed"



fi
