#!/bin/bash
touch cmtp.log
# Read the contents of the rawText.txt file
cp rawText.txt raw_text.txt
text=$(<raw_text.txt)

# Replace all tab characters with newline characters
rawTextft=$(echo "$text" | tr '\t' '\n')

# Replace all single character test types with their full names
rawTextft=${rawTextft//\(F\)/\(Finance\)}
rawTextft=${rawTextft//\(T\)/\(Technical\)}
rawTextft=${rawTextft//\(C\)/\(Consultancy\)}

echo "$rawTextft" > raw_text.txt

# Loop over the lines and create a directory for each time frame
while read line
do
    # Check if the first character is a number or Optional
    if [[ $line =~ ^[0-9] || $line = "Optional" ]]; then
        # create directory and assign a variable
        mkdir -p "$line"
        timeFrame="$line"
    else
        # create the subdirectory 
        mkdir -p "$timeFrame/$line"

        # create the two docx file
        touch "$timeFrame/$line/studyNotes.docx"
        touch "$timeFrame/$line/testHistory.docx"

        # logs the creation of new CMTPs
        echo "$(date): $timeFrame/$line was created." >> cmtp.log
    fi
done < raw_text.txt

# delete the modified raw_text file
rm raw_text.txt
