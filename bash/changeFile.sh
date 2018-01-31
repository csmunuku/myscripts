#!/bin/bash
#########################################################################################
# changeFile.sh
#########################################################################################
# takes source file as arguments stored here as file1

# Current timestamp
ts="`date '+%b_%d_%H%M%S'`"

# validate input - one argument
if [ $# -ne 1 ]; then
   echo "Please specify a file as arguments that you want to modify"
   exit 1
fi

file1="$1"
file2="/tmp/myTempFile_${ts}.txt"
touch ${file2}
if [ ! -f $file1 ]; then
   echo " The file $file1 doesn't exist in your current directory. Please double check"
   exit 1
fi
echo "Select from the following choices:"
echo "###################################################################################################"
echo -e "1) n spaces in \"$file1\" to a single space\t\t 8) comma in \"$file1\" to a space"
echo -e "2) space in \"$file1\" to a comma\t\t\t 9) comma in \"$file1\" to a semi-colon"
echo -e "3) space in \"$file1\" to a semi-colon\t\t\t 10) comma in \"$file1\" to a colon"
echo -e "4) space in \"$file1\" to a colon\t\t\t 11) comma in \"$file1\" to a new-line"
echo -e "5) space in \"$file1\" to a new-line\t\t\t 12) comma in \"$file1\" to a tab"
echo -e "6) space in \"$file1\" to a tab\t\t\t\t 13)comma in \"$file1\" to a pipe"
echo -e "7) space in \"$file1\" to a pipe"
echo -e "##############################################\t\t###########################################"
echo -e "14) semi-colon in \"$file1\" to a space\t\t\t 20) colon in \"$file1\" to a space"
echo -e "15) semi-colon \"$file1\" to a comma\t\t\t 21) colon \"$file1\" to a comma"
echo -e "16) semi-colon \"$file1\" to a colon\t\t\t 22) colon \"$file1\" to a semi-colon"
echo -e "17) semi-colon \"$file1\" to a new-line\t\t\t 23) colon \"$file1\" to a new-line"
echo -e "18) semi-colon \"$file1\" to a tab\t\t\t 24) colon \"$file1\" to a tab"
echo -e "19) semi-colon \"$file1\" to a pipe\t\t\t 25) colon \"$file1\" to a pipe"
echo -e "##############################################\t\t###########################################"
echo -e "26) new-line in \"$file1\" to a space\t\t\t 32) tab in \"$file1\" to a space"
echo -e "27) new-line in \"$file1\" to a comma\t\t\t 33) tab in \"$file1\" to a comma"
echo -e "28) new-line in \"$file1\" to a semi-colon\t\t 34) tab in \"$file1\" to a semi-colon"
echo -e "29) new-line in \"$file1\" to a colon\t\t\t 35) tab in \"$file1\" to a colon"
echo -e "30) new-line in \"$file1\" to a tab\t\t\t 36) tab in \"$file1\" to a new-line"
echo -e "31) new-line in \"$file1\" to a pipe\t\t\t 37) tab in \"$file1\" to a pipe"
echo -e "##############################################\t\t###########################################"
echo -e "38) pipe in \"$file1\" to a space\t\t\t "
echo -e "39) pipe in \"$file1\" to a comma\t\t\t "
echo -e "40) pipe in \"$file1\" to a semi-colon\t\t\t "
echo -e "41) pipe in \"$file1\" to a colon\t\t\t "
echo -e "42) pipe in \"$file1\" to a new-line\t\t\t "
echo -e "43) pipe in \"$file1\" to a tab\t\t\t "
echo -e "#######################################################################################################"
echo -e "44) DOS ^M characters in \"$file1\" to UNIX Format"
echo -e "45) UNIX format file \"$file1\" to DOS Format"
echo -e "46) remove leading spaces in \"$file1\""
echo -e "47) remove trailing spaces in \"$file1\""
echo -e "48) Copy only portion of \"$file1\" to a new file \"$file2\" by providing line numbers"
echo -e "49) Change all Character in \"$file1\" to Lower case"
echo -e "50) Change all Character in \"$file1\" to Upper case"
echo -e "51) Remove all empty lines in \"$file1\""
echo -e "52) Remove all lines containing a search string in \"$file1\" and write the output to \"$file2\""
echo -e "53) Remove all lines containing a CASE SENSITIVE search string in \"$file1\" and write the output to \"$file2\""
echo -e "54) Replace all lines containing a string in \"$file1\" with another string and write the output to \"$file2\""
echo -e "55) Replace all lines containing a CASE SENSITIVE string in \"$file1\" with another string and write the output to \"$file2\""
echo -e "56) Remove all leading and trailing spaces in \"$file1\" and write the output to \"$file2\""
echo -e "#############################################################################################"
echo -e "What you want to change in \"$file1\" to create \"$file2\" - select a number from the above Menu"
echo -e "Please Enter your Choices:"
read input

case $input in
    1) /usr/bin/tr -s ' ' ' ' < $file1 > $file2
    ;;
    2) /usr/bin/tr ' ' ',' < $file1 > $file2
    ;;
    3) /usr/bin/tr ' ' ';' < $file1 > $file2
    ;;
    4) /usr/bin/tr ' ' ':' < $file1 > $file2
    ;;
    5) /usr/bin/tr ' ' '\n' < $file1 > $file2
    ;;
    6) /usr/bin/tr ' ' '\t' < $file1 > $file2
    ;;
    7) /usr/bin/tr ' ' '|' < $file1 > $file2
    ;;
    8) /usr/bin/tr ',' ' ' < $file1 > $file2
    ;;
    9) /usr/bin/tr ',' ';' < $file1 > $file2
    ;;
    10)/usr/bin/tr ',' ':' < $file1 > $file2
    ;;
    11) /usr/bin/tr ',' '\n' < $file1 > $file2
    ;;
    12) /usr/bin/tr ',' '\t' < $file1 > $file2
    ;;
    13) /usr/bin/tr ',' '|' < $file1 > $file2
    ;;
    14) /usr/bin/tr ';' ' ' < $file1 > $file2
    ;;
    15) /usr/bin/tr ';' ',' < $file1 > $file2
    ;;
    16) /usr/bin/tr ';' ':' < $file1 > $file2
    ;;
    17) /usr/bin/tr ';' '\n' < $file1 > $file2
    ;;
    18) /usr/bin/tr ';' '\t' < $file1 > $file2
    ;;
    19) /usr/bin/tr ';' '|' < $file1 > $file2
    ;;
    20) /usr/bin/tr ':' ' ' < $file1 > $file2
    ;;
    21) /usr/bin/tr ':' ',' < $file1 > $file2
    ;;
    22) /usr/bin/tr ':' ';' < $file1 > $file2
    ;;
    23) /usr/bin/tr ':' '\n' < $file1 > $file2
    ;;
    24) /usr/bin/tr ':' '\t' < $file1 > $file2
    ;;
    25) /usr/bin/tr ':' '|' < $file1 > $file2
    ;;
    26) /usr/bin/tr '\n' ' ' < $file1 > $file2
    ;;
    27) /usr/bin/tr '\n' ',' < $file1 > $file2
    ;;
    28) /usr/bin/tr '\n' ';' < $file1 > $file2
    ;;
    29) /usr/bin/tr '\n' ':' < $file1 > $file2
    ;;
    30) /usr/bin/tr '\n' '\t' < $file1 > $file2
    ;;
    31) /usr/bin/tr '\n' '|' < $file1 > $file2
    ;;
    32) /usr/bin/tr '\t' ' ' < $file1 > $file2
    ;;
    33) /usr/bin/tr '\t' ',' < $file1 > $file2
    ;;
    34) /usr/bin/tr '\t' ';' < $file1 > $file2
    ;;
    35) /usr/bin/tr '\t' ':' < $file1 > $file2
    ;;
    36) /usr/bin/tr '\t' '\n' < $file1 > $file2
    ;;
    37) /usr/bin/tr '\t' '|' < $file1 > $file2
    ;;
    38) /usr/bin/tr '|' ' ' < $file1 > $file2
    ;;
    39) /usr/bin/tr '|' ',' < $file1 > $file2
    ;;
    40) /usr/bin/tr '|' ';' < $file1 > $file2
    ;;
    41) /usr/bin/tr '|' ':' < $file1 > $file2
    ;;
    42) /usr/bin/tr '|' '\n' < $file1 > $file2
    ;;
    43) /usr/bin/tr '|' '\t' < $file1 > $file2
    ;;
    44) dos2unix -n $file1 $file2
    ;;
    45) unix2dos -n $file1 $file2
    ;;
#   46) /usr/bin/tr '^[ \t]*' '' < $file1 > $file2
    46) sed 's/^[ ]*//g' < $file1 > $file2
    ;;
    47) perl -wpl -e 's|[ \tr]*$||g;' < $file1 > $file2
    ;;
    48) echo "Please enter a starting line number - $file1:"
    read number1
    echo "Please enter an ending line number   - $file1:"
    read number2
    sed -n '${number1},${number2}p' $file1 > $file2
    ;;
    49) /usr/bin/tr '[A-Z]' '[a-z]' < $file1 > $file2
    ;;
    50) /usr/bin/tr '[a-z]' '[A-Z]' < $file1 > $file2
    ;;
    51) grep -v '^$' $file1 > $file2
    ;;
    52) echo "Please Enter the string you DON\'T want in your destination file"
    read searchstring
    grep -iv "$searchstring" $file1 > $file2
    ;;
    53) echo "Please Enter the string - CASE SENSITIVE - you DON\'T want in your destination file"
    read searchstring
    grep -v "$searchstring" $file1 > $file2
    ;;
    54) echo "Please Enter the string you want to replace from your source file $file1 "
    read searchstring
    echo "Please Enter the new string you want to replace $searchstring in your destination file $file2 "
    read replaceString
    sed "s|${searchstring}|${replaceString}|g" ${file1} > ${file2}
    ;;
    55) echo "Need to implement this"
    ;;
    56)  sed -e 's/^[ ]*//g' -e 's/[ ]*$//g' < $file1 > $file2
    ;;
    *) echo "BAD selection has been made. Please Try again"
    ;;
 esac
