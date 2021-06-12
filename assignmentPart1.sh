dataInput=$1
fileName=$2
if test $# -lt 2
then echo "supply 2 inputs"
exit 1
fi
if test dataInput -a fileName 
then

echo "a: Search"
echo "b:Insert string at beginning of file"
echo "c:Insert string at end of file"
echo "d:Insert at beginning of 5th line"
echo "e:Exit"
while :
do
echo "enter your choice:"
read choice
case $choice in 
"a") 
if grep "$dataInput" $fileName
then 
    echo "$dataInput found in file"
else
    echo "$dataInput do not found"
fi
;;
"b") 
echo "Content of file before insertion"
cat $fileName
echo "$dataInput" >> newFile.txt
     
     cat $fileName>>newFile.txt
  
         mv newFile.txt $fileName
      
        echo "$dataInput added in beginning of file"
echo "Content of file after Insertion"
cat $fileName ;;
"c") echo "$dataInput" >> $fileName
      echo "$dataInput added in end of file"
      echo -n "content of file after insertion"
      cat $fileName;;
"d") lines=0
      while read line
       do
            lines=`expr $lines + 1`
       done< $fileName 
echo $lines
if test $lines -lt 5
then echo "file has lines less than 5"
else
sed -i '5s/^/dataInput/#&' $fileName 
echo "$dataInput inserted"
echo -n "Content of file after insertion"
cat $fileName 
fi;;
       
"e") echo "Thankyou" 
     exit;;
*) echo "invalid choice";;
esac

done
else
echo "invalid input"
fi
