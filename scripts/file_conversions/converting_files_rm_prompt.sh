#!/bin/bash
file_extension=m4v
file_conversion=mp4
#directory="${PWD##*/}"
directory="$PWD"
directory_cp=temp_directory
echo "$PWD"
rsync -a "$directory/" "$directory_cp"
for i in *."$file_extension";do
		echo "Starting conversion to $file_conversion"
#		ffmpeg -i "$i" "${i%.*}."$file_conversion"";
done
while true; do
    read -p "Delete original files?" yn
    case $yn in
        [Yy]* ) rm *.$file_extension;;
        [Nn]* ) ;;
        * ) echo "Please answer yes or no.";;
    esac
    read -p "Check the contents of this folder? Delete copied folder?" yn
    case $yn in
        [Yy]* ) rm -rf $directory_cp; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
