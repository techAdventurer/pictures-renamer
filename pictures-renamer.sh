#!/bin/bash
echo "What is the subject of the pictures?"
read subject

echo "What is the extension of the pictures (ex: .jpg)?"
read picture_extension

pictures_list=$(ls *$picture_extension)

for picture in $(ls *$picture_extension)
do
	picture_create_date=$(echo $(exiftool -T -createdate $picture | awk '{print $1}') | awk -F ":" '{print $1"-"$2"-"$3}')
	picture_create_time=$(echo $(exiftool -T -createdate $picture | awk '{print $2}') | awk -F ":" '{print $1"h"$2"m"$3"s"}')

	new_picture_name=$subject"_"$picture_create_date"_"$picture_create_time

	if $(test -e $new_picture_name); then
		echo "Name already used - appending random string"
		echo "Renaming $picture to $new_picture_name-$(xxd -l 5 -c 5 -p < /dev/random)$picture_extension"
		mv $picture "$new_picture_name-$(xxd -l 5 -c 5 -p < /dev/random)$picture_extension"
	else
		echo "Renaming $picture to $new_picture_name$picture_extension"
		mv $picture $new_picture_name$picture_extension
	fi
done
