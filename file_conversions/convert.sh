#!/bin/bash
set -ex

read -p "Would you like to rename the file: " answer

if [[ $answer = y ]] ; then
#	# Take the original filename
	read -p "Enter the original filename to rename: " original
	# Take the renamed filename
	read -p "Enter the renamed filename to rename: " rename
	# Check the original file exists or not
	#mv ${original%.*} ${rename%.*}
	mv $original $rename
fi


read -p "Enter extension: " file_extension
read -p "Enter conversion format: " file_conversion

directory_cp=temp_directory

# check if tmp dir exists
if [[ ! "$directory_cp" || ! -d "$directory_cp" ]]; then
  echo "Could not create temp dir"
  mkdir $directory_cp
  echo "Directory copy $directory_cp made"
  exit 1
fi

# deletes the temp directory
function cleanup {      
  rm -rf "$directory_cp"
  echo "Deleted temp working directory $directory_cp"
}

## register the cleanup function to be called on the EXIT signal
#trap cleanup EXIT

read -p "File to convert: " directory

if [[ $directory -ge "here" ]]
then
	directory="$PWD"
fi

#directory_cp=temp_directory
echo "$PWD"
#rsync -a "$directory/" "$directory_cp"


for i in *."$file_extension";do
		echo "Starting conversion to $file_conversion"
		ffmpeg -i "$i" "${i%.*}."$file_conversion"";
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

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT
