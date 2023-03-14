#!/bin/bash

#Bash script to scrape mess from NITC Website

curl https://nitc.ac.in/hostels/overview | grep .pdf | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" >> /tmp/pdf.txt

# Ask if they are Eligible for Egrantz (Y/N)

echo "Are You Availing the Egrantz Scholarship ? (Y/N)"
read VA

if [[ $VA = Y ]]; then
  cat /tmp/pdf.txt | grep e-grantz | head -1 > /tmp/link.txt
  wget -i /tmp/link.txt
  cat /tmp/link.txt
  rm /tmp/link.txt
  rm /tmp/pdf.txt
  echo "Egrantz Downloaded Successfully"
elif [[ $VA = N ]]; then
  cat /tmp/pdf.txt | grep dues | head -1 > /tmp/lind.txt
  wget -i /tmp/lind.txt
  cat /tmp/lind.txt
  rm /tmp/lind.txt
  rm /tmp/pdf.txt
  echo "Mess Dues Downloaded Successfully"
fi

# End of Script


