#!/bin/bash

# Check if CMTP name is passed as an argument
if [ $# -eq 0 ];then

  read -p "Please provide the name of the CMTP as an argument.  "  line

  else
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] No CMTP name argument passed to addCMTP.sh" >> cmtp.log

  exit 1
fi

#Function to display options and ask for user input
get_user_input() {
echo "1) 0-1 Months"
echo "2) 1-3 Months"
echo "3) 3-12 Months"
echo "4) 12-24 Months"
echo "5) Optional"
echo "6) Exit"

read -p "Enter the number corresponding to the time frame: " userInput

case $userInput in 
1) directory="0-1 Months";;
2) directory="1-3 Months";;
3) directory="3-12 Months";;
4) directory="12-24 Months";;
5) directory="Optional";;
6) echo "Exiting the script."
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Exited the script." >> cmtp.log
exit;;
*) echo "Invalid option selected. Please try again."
get_user_input;;
esac
}

#Call the function to get user input
get_user_input

# Prompt user to select the CMTP category
echo "Select the CMTP category:"
echo "T) Technical"
echo "F) Finance"
echo "C) Consultancy"
echo "E) Exit"
read -p "Enter your choice (T/F/C/E): " cmtpCategory

# Validate user input
while true; do
  case $cmtpCategory in
    [Tt])
      cmtpCategory="Technical"
      break
      ;;
    [Ff])
      cmtpCategory="Finance"
      break
      ;;
    [Cc])
      cmtpCategory="Consultancy"
      break
      ;;
    [Ee])
      echo "[$(date +'%Y-%m-%d %H:%M:%S')] Exiting script." >> cmtp.log
      exit 0
      ;;
    *)
      echo "Invalid option selected."
      echo "Select the CMTP category:"
      echo "T) Technical"
      echo "F) Finance"
      echo "C) Consultancy"
      echo "E) Exit"
      read -p "Enter your choice (T/F/C/E): " cmtpCategory
      ;;
  esac
done

dir_name="$line - ($cmtpCategory)"
#Create the directory for the selected time frame
if [ ! -d "$directory/$dir_name" ]; then
mkdir "$directory/$dir_name"
touch "$directory/$dir_name/studyNotes.docx"
touch "$directory/$dir_name/testHistory.docx"
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Created directory '$directory/$dir_name'" >> cmtp.log
else
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Error: Directory '$directory/$dir_name' already exists." >> cmtp.log
exit 1
fi

exit 0






