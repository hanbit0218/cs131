**MY CODE: **

* checks if file exists
```
if [ ! -f "$1" ]; then
  echo "Error: File does not exist"
  exit 1
fi
```
* gets and prints curent date/time and last modified date of file
```
CURRENT_DATE=$(date +%Y-%m-%d-%H-%M-%S
LAST_MODIFIED_DATE=$(stat -c "%y" "$1")
echo "Current Date and Time: $CURRENT_DATE"
echo "Last Modified Date: $LAST_MODIFIED_DATE"
```
* asks user if they are sure they want to modify lmd
```
read -p "Do you want to change the last modified date? (y/n): " RESPONSE
```
* prompts user for new date, convert to the required format YYYY-MM-DD HH:MM:SS, and actually modifies the last edited date
```
if [ "$RESPONSE" = "y" ]; then
  read -p "Enter the new last modified date (YYYYMMDD): " NEW_LAST_MODIFIED_DATE
  NEW_LAST_MODIFIED_DATE=$(date -d "$NEW_LAST_MODIFIED_DATE" +%Y%m%d%H%M.%S)
  touch -t "$NEW_LAST_MODIFIED_DATE" "$1"
  echo "Last Modified Date changed successfully"
```
* lets user know that date has not been modified
```
else
  echo "Last Modified Date not changed"
fi
```

**What this command does:**
* This command takes a file as input and allows the user to change the "last modified" date of the file.

**Why/When this command is useful :**
* Lets say that you had to turn in a report to your boss by a quota, but you procrastinated and was not able to finish it on time. The boss wants you to provide proof that the last time you modified that file was before the due date. Simply pull out my tool and modify the date and submit it! :) 

**How you can use this command**
* run script
```
./date_change.sh <path to file>
```
* check stat of file
```
stat -c "%y" <filename>
```

**Example:**
* input: [ y ]
```
[davidsu24@sjsu a2]$ ./date_change.sh /mnt/scratch/davidsu24/cs131/a2/a2test.txt
Current Date and Time: 2024-07-03-01-40-59
Last Modified Date: 2000-12-12 00:00:00.000000000 -0500
Do you want to change the last modified date? (y/n): y
Enter the new last modified date (YYYYMMDD): 20110826
Last Modified Date changed successfully
[davidsu24@sjsu a2]$ stat -c "%y" a2test.txt
2011-08-26 00:00:00.000000000 -0400
```
* input: [ n ]
```
[davidsu24@sjsu a2]$ ./date_change.sh /mnt/scratch/davidsu24/cs131/a2/a2test.txt
Current Date and Time: 2024-07-03-12-44-33
Last Modified Date: 2011-08-26 00:00:00.000000000 -0400
Do you want to change the last modified date? (y/n): n
Last Modified Date not changed
```

**Future Work: **
* I could improve it so that it also changes the creation date of the file as well. 
