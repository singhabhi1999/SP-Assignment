#!/bin/bash

if [ $# != 2 ]
then
	echo "ERROR! Improper Argument List";
	exit 1;
fi
while true 
do
echo "<---------------------------------My App----------------------------------->";
echo "a: Search";
echo "b: Insert the string at the begining of the file";
echo "c: Insert the string at the end of the file";
echo "d: Insert at begining of 5th Line";
echo "e: exit";
echo "Enter your choice : ";
read choice;
case "$choice" in
	"a")
		if grep -q $1 $2
		then
			echo "String $1 Found in $2 file !!";
		else
			echo "String $1 not Present in $2 file !!"
		fi;
		echo "";;
	"b")
		echo "Content of the original file is : ";
		cat $2;
		sed -i "1s/^/$1 /" $2;
		echo "Content of the file $2 after inserting '$1' at the begining : ";
		cat $2;
		echo " ";
		;;
	"c")
		echo "Content of the original file is : ";
		cat $2;
		echo $1 >> $2;
		echo "Content of the file $2 after inserting '$1' at the end : ";
		cat $2;
		echo " ";
		;;
	"d")
		lines=$(cat $2 | wc -l);
		if [ $lines -lt 5 ] 
		then 
			echo "The file does not have a atleast 5 lines in it, cannot insert at 5th line !!";
			echo " ";
		else
			echo "Content of the Original file is :";
			cat $2;
			sed -i "5s/^/$1 /" $2;
			echo "Content of the file $2 after inserting '$1' at the 5th line :"
			cat $2;
			echo " ";
		fi
	;;

	"e")
		echo "Exiting......";
		exit 1;;
	*) echo "Invalid choice!!";;
esac
done
