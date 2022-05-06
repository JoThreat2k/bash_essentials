#!/bin/bash


# A houskeeping script to manage the downloads directory

# To Do 
# renames screen shots to a more scriptable format
# check download folder for a .sha file to compare with downloaded file.
# clears meta data from image files 
# renames screen shots to a more scriptable format
# filter file destination by file type
# read about global vs local variables in bash

# Doing
# finish writing out code for user decision possibilities in case switch 
# add every filetype to corresponding array - current file type list => https://www.computerhope.com/issues/ch001789.htm#compressed
# create a VM with a cp of downloads dir for testing


group_shred(){
	#file types
 	pic_fs=('.png' '.jpg' '.jpeg' '.pdf' '.ai' '.bmp' '.ico' '.ps' '.psd' '.svg' '.tiff' '.tif')
	compressed_fs=('.zip' '.bz2' '.tar' '.deb' '.xz' '.pkg' '.rar' '7z' 'arj' 'rpm' 'tar.gz' '.z') 
	hash_fs=('.sha')
	windws_fs=('.doc' '.docx' '.ps1')
	iso_fs=('.iso' '.img')

	
	trash="/dev/null"
	
	# prompt user for group to send to shredder 
	echo "1 = Picture Files"
	echo "2 = Compressed Files" 
	echo "3 = hash Files"
	echo "4 = Windows Files"
	echo "5 = Image Files"
	echo " "
	echo -n "[+] For starters, are there any file types to isolate for deletion? [1-5]: "
	read -r choice
	echo

	#output array & prompt for specific target
	case $choice in 		
		1)
			echo "${pic_fs[@]}"
			echo
			echo -n "Which image file in particular ? [example: .png ]: "
			echo
			read -r d 
				#finds user selection in array
				for i in "${pic_fs[@]}"; do 
					[[ "$d" == "$i" ]]					
					#deletes group based on filetype
					cat "$trash" > *$( echo "$d" )
					mv * $( echo "$d") "$trash"
					break
				done	
			;;
		2) 
			echo "${compressed_fs[@]}\n"
			echo
			echo -n "Which compressed file in particular ? [example: .zip ]: "
			echo
			read -r d 
				for i in "${compressed_fs[@]}"; do
					[[ "$d" == "$i" ]]
					cat "$trash" > *$( echo "$d")
					mv *$( echo "$d") "$trash"
					break
				done
			;;
		3)
			echo "${hash_fs[@]}"
			echo 
			#are there other types of encryption files?
			echo -n "Which encryption file in particular? [example: .sha256]: "
			echo
			read -r d
			for i in "${hash_fs[@]}"; do
				[[ "$d" == "$i" ]]
				cat "$trash" > *$( echo "$d" )
				mv *$( echo "$d") "$trash"
				break
			done	
			;;
		4)	echo "${windws_fs[@]}"
			echo
		 	echo -n "Which windows filetype in particular ? [example: .doc]"
			echo
			read -r d
			for i in "${windws_fs[@]}"; do 
				[[ "$d" == "$i" ]]
				cat "$trash" > *$( echo "$d")
				mv *$( echo "$d") "$trash"
				break
			done
			;;
		5)	echo -n "${iso_fs[@]}"
			echo
			echo -n "Which iso filetype in particular ? [Example : .iso]"
			echo
			read -r d
			for i in "${iso_fs[@]}"; do	
				[[ "$d" == "$i" ]]
				cat "$trash" > *$( echo "$d")
				mv $( echo "$d") "$trash"
				break
			done
			;;
		*) 
			echo -n "Unknown file type"
	esac


}

file_move(){
	# checks if file exists in in new dir
	# prompt user then move files to dir based on type	
	
	#file types
 	pic_fs=('.png' '.jpg' '.jpeg' '.pdf' '.ai' '.bmp' '.ico' '.ps' '.psd' '.svg' '.tiff' '.tif')
	compressed_fs=('.zip' '.bz2' '.tar' '.deb' '.xz' '.pkg' '.rar' '7z' 'arj' 'rpm' 'tar.gz' '.z') 
	sha_fs=('.sha')
	windws_fs=('.doc' '.docx' '.ps1')
	iso_fs=('.iso' '.img')

	#dir locations 
	pic_dir="	"
	
	#prompt user 
	echo -n "Would you like your files sorted [y or n]?"
	read -r a  
	#if user wants files sorted 
	if [[ "$a" == "y" ]];then 
		echo "1 = specific file type" 
		echo "2 = all the files"
		read -r d
		#if user wants specific files sorted 
		if [[ "$d" == "1" ]]; then
			echo -n "[+] Choose the file type you would like sorted [1-5]: "
			echo "1 = Picture Files"
			echo "2 = Compressed Files" 
			echo "3 = Hash Files"
			echo "4 = Windows Files"
			echo "5 = Image Files"
			echo " "
			read -r choice
			case $choice in 		
			1)
				#move all pics to pic dir
				mv "${pic_fs[@]}"
				;;
			*)
				[[ "$a" == "n" ]];then
				
					break
		  

	fi

}

ss_renamer(){
	# renames screenshots to better format
}

ss_cleaner(){
	#a function that only cleans meta data of "${img_fs}" using exif tool 
}






