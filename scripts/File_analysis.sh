#!/bin/bash
echo "Enter the filename:"
read filename
if [ -f "$filename" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
---------------------------------------
#!/bin/bash
echo "Enter the filename:"
read filename
if [ -r "$filename" ]; then
    echo "File has read permission"
else
    echo "File does not have read permission"
fi

if [ -w "$filename" ]; then
    echo "File has write permission"
else
    echo "File does not have write permission"
fi
--------------------------------------
#!/bin/bash
echo "Enter the filename:"
read filename
echo "Enter the text to write into the file:"
read text
echo "$text" > "$filename"
echo "Text written to $filename"
--------------------------------------
#!/bin/bash
echo "Enter the filename:"
read filename
if [ -f "$filename" ]; then
    filesize=$(stat -c%s "$filename")
    echo "Size of $filename is $filesize bytes."
else
    echo "File does not exist."
fi
-----------------------------------------
#!/bin/bash
echo "Enter the filename:"
read filename
if [ -f "$filename" ]; then
    lines=$(wc -l < "$filename")
    words=$(wc -w < "$filename")
    chars=$(wc -m < "$filename")
    echo "Lines: $lines"
    echo "Words: $words"
    echo "Characters: $chars"
else
    echo "File does not exist."
fi
--------------------------------------
#!/bin/bash
echo "Enter the filename:"
read filename
if [ -f "$filename" ]; then
    while IFS= read -r line
    do
        echo "$line"
    done < "$filename"
else
    echo "File does not exist."
fi
--------------------------------------
#!/bin/bash
echo "Enter the filename:"
read filename
echo "Enter the text to find:"
read find_text
echo "Enter the replacement text:"
read replace_text
if [ -f "$filename" ]; then
    sed -i "s/$find_text/$replace_text/g" "$filename"
    echo "Text replaced in $filename"
else
    echo "File does not exist."
fi
------------------------------------------
#!/bin/bash
echo "Enter the source directory:"
read src_dir
echo "Enter the destination directory:"
read dest_dir

if [ -d "$src_dir" ] && [ -d "$dest_dir" ]; then
    total_files=$(find "$src_dir" -type f | wc -l)
    copied_files=0

    for file in "$src_dir"/*
    do
        cp "$file" "$dest_dir"
        copied_files=$((copied_files + 1))
        progress=$(( (copied_files * 100) / total_files ))
        echo -ne "Progress: $progress%\r"
    done
    echo "Copy complete."
else
    echo "One of the directories does not exist."
fi
--------------------------------------------
#!/bin/bash
echo "Enter the directory to backup:"
read src_dir
echo "Enter the backup directory:"
read backup_dir

if [ -d "$src_dir" ] && [ -d "$backup_dir" ]; then
    find "$src_dir" -type f -mtime -1 -exec cp {} "$backup_dir" \;
    echo "Backup complete."
else
    echo "One of the directories does not exist."
fi
----------------------------------------
