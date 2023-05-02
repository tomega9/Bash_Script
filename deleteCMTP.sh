#!/bin/bash
# Check if CMTP name is passed as an argument and ask for the file to be deleted
if [ $# -eq 0 ];then

  read -p "Please provide the name of the CMTP as an argument.  "  cmtpName

  for dir in */; do
    if [ -d "${dir}${cmtpName}" ]; then
    found=1
    echo "Are you sure you want to delete the CMTP '$cmtpName' in directory '$dir'? (Y/N)"
    read -r answer
    if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
      rm -rf "${dir}${cmtpName}"
      echo "[$(date +'%Y-%m-%d %H:%M:%S')] Deleted CMTP '$cmtpName' in directory '$dir'" >> cmtp.log
    fi
    break
    fi
    done
else
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] Error: CMTP '$cmtpName' not found in any sub-directory." >> cmtp.log
  exit 1
fi



