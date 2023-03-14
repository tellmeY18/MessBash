#!/bin/bash

#Bash script to scrape mess from NITC Website

curl https://nitc.ac.in/hostels/overview | grep .pdf | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" >> /tmp/pdf.txt
cat /tmp/pdf.txt | grep e-grantz-students | head -1 > /tmp/link.txt
cat /tmp/pdf.txt | grep dues-up | head -1 >> /tmp/link.txt
cd res
aria2c  --input-file=/tmp/link.txt 
rm -rf /tmp/link.txt
mv *e-grantz* 1.pdf
pdftotext -layout 1.pdf
rm -rf 1.pdf
echo "What's Your Roll Number? "
read -r Roll 
cat 1.txt | grep $Roll > ToBePaid
mv *dues* 2.pdf 
pdftotext -layout 2.pdf 
cat 2.txt | grep $Roll >> ToBePaid
rm -rf 2.pdf
cat ToBePaid

# Ask if they are Eligible for Egrantz (Y/N)

#echo "Are You Availing the Egrantz Scholarship ? (Y/N)"
#read VA

#if [[ $VA = Y ]]; then
# #  wget -i /tmp/link.txt --output-file=/tmp/Eg.pdf
#  pdftotext -layout /tmp/Eg.pdf ~/.local/dat.txt
#
#  rm /tmp/link.txt
#  rm /tmp/pdf.txt
#  cat ~/.local/dat.txt | grep $Roll 
#elif [[ $VA = N ]]; then
#  cat /tmp/pdf.txt | grep dues | head -1 > /tmp/lind.txt
#  wget -i /tmp/lind.txt --output-file=/tmp/dd.pdf
#  pdftotext -layout /tmp/dd.pdf ~/.local/dat.txt
#
#  cat /tmp/lind.txt
#  rm /tmp/lind.txt
#  rm /tmp/pdf.txt
#  echo "Mess Dues Downloaded Successfully"
#fi


# End of Script


