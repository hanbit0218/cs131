What this command does
* This command takes a file as input and allows the user to change the "last modified" date of the file.

Why/When this command is useful 
* Lets say that you had to turn in a report to your boss by a quota, but you procrastinated and was not able to finish it on time. The boss wants you to provide proof that the last time you modified that file was before the due date. Simply pull out my tool and modify the date and submit it! :) 

How you can use this command
* ./date_change.sh <path to file>
* stat -c "%y" <filename>

Examples (Copy/Paste the actual terminal execution results)
[davidsu24@sjsu a2]$ ./date_change.sh /mnt/scratch/davidsu24/cs131/a2/a2test.txt
Current Date and Time: 2024-07-03-01-40-59
Last Modified Date: 2000-12-12 00:00:00.000000000 -0500
Do you want to change the last modified date? (y/n): y
Enter the new last modified date (YYYYMMDD): 20110826
Last Modified Date changed successfully
[davidsu24@sjsu a2]$ stat -c "%y" a2test.txt
2011-08-26 00:00:00.000000000 -0400
