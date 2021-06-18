# SP-Assignment
# Part 1:
Write a menu based shell script to do the following:
•	accept a string and a file name from the user as command line arguments.  
•	displays the following menu
a: search
b: insert the string at the beginning of the file
c: insert the string at the end of the file
d: insert at beginning of 5th line
e: exit
Script should also print an error message in case user gives less or more number of arguments.  For option “d” if the number line is less than 5, error should be displayed.

# Part 2:
Find duplicate files. Suppose you're working in a project where software (or people) create lots of files, many of them duplicates. You don't want the duplicates: you want just one copy of each, to save disk space. Write a shell script "sameln" that takes a single argument naming a directory D, finds all regular files immediately under D that are duplicates, and replaces the duplicates with hard links. Your script should not recursively examine all files that are in subdirectories of D; it should examine only files that are immediately in D.

If your script finds two or more files that are duplicates, it should keep the file whose name is lexicographically first (for example, if the duplicates are named X, A, and B, it should keep A and replace X and B with hard links to A); however, it should prefer files whose name start with "." to other files (for example, if the duplicates are named .Y, .X, A, and B, it should keep .X and replace the others with hard links to .X).

If your script finds a file in D that is not a regular file, it should silently ignore it; for example, it should silently ignore all symbolic links and directories. If your script has a problem reading a file (for example, if the file not readable to you), it should report the error and not treat it as a duplicate of any file.

You need to worry about the cases where your script is given no arguments, or more than one argument and also be prepared to handle files whose names contain special characters like spaces, "*", and leading "–".


## Note :- Please check whether file names are same after cloning since windows doesn't support many file name characters of linux