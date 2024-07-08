#!/bin/bash
echo "Enter a string:"
read str
echo "Length of string is: ${#str}"

--------------------------

#!/bin/bash
echo "Enter a string:"
read str
echo "Enter the position to start extracting:"
read position
echo "Enter the length of the substring:"
read length
echo "Substring is: ${str:$position:$length}"

------------------------------

#!/bin/bash
echo "Enter first string:"
read str1
echo "Enter second string:"
read str2

if [ "$str1" == "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

------------------------------------

#!/bin/bash
echo "Enter first string:"
read str1
echo "Enter second string:"
read str2
result="$str1$str2"
echo "Concatenated string is: $result"

--------------------------------------------------

#!/bin/bash
echo "Enter the main string:"
read main_str
echo "Enter the substring to search:"
read sub_str

if [[ "$main_str" == *"$sub_str"* ]]; then
    echo "Substring found"
else
    echo "Substring not found"
fi

-----------------------------------------------

#!/bin/bash
echo "Enter the main string:"
read main_str
echo "Enter the substring to replace:"
read old_sub_str
echo "Enter the new substring:"
read new_sub_str
result="${main_str//$old_sub_str/$new_sub_str}"
echo "Modified string: $result"

----------------------------------------------

#!/bin/bash
echo "Enter a string:"
read str
echo "Uppercase: ${str^^}"
echo "Lowercase: ${str,,}"

----------------------------------------

#!/bin/bash
echo "Enter the main string:"
read main_str
echo "Enter the substring to count:"
read sub_str
count=$(grep -o "$sub_str" <<< "$main_str" | wc -l)
echo "The substring occurs $count times."

-----------------------------------------

#!/bin/bash
echo "Enter a string:"
read str
echo "Reversed string: $(echo $str | rev)"

----------------------------------------

#!/bin/bash
echo "Enter a string:"
read str
if [ "$str" == "$(echo $str | rev)" ]; then
    echo "The string is a palindrome"
else
    echo "The string is not a palindrome"
fi
