#!/bin/bash


# A houskeeping script to manage the downloads directory

# To Do 
# renames screen shots to a more scriptable format
# check download folder for a .sha file to compare with downloaded file.
# clears meta data from image files 
# renames screen shots to a more scriptable format
# filter file destination by file type

# Doing
# finish writing out code for user decision possibilities in case switch 
# add every filetype to corresponding array - current file type list => https://www.computerhope.com/issues/ch001789.htm#compressed
# create a VM with a cp of dowloads dir for testing


group_shred(){
	#file types
 	img_fs=('.png' '.jpg' '.jpeg' '.pdf' '.ai' '.bmp' '.ico' '.ps' '.psd' '.svg' '.tiff' '.tif')
	compressed_fs=('.zip' '.bz2' '.tar' '.deb' '.xz' '.pkg' '.rar' '7z' 'arj' 'rpm' 'tar.gz' '.z') 
	sha_fs=('.sha')
	windws_fs=('.doc' '.docx')
	iso_fs=('.iso' '.img')

	
	trash="/dev/null"
	
	# prompt user for group to send to shredder 
	echo "1 = Picture Files"
	echo "2 = Compressed Files" 
	echo "3 = .sha Files"
	echo "4 = Windows Files"
	echo "5 = Iso Files"
	echo " "
	echo -n "[+] For starters, are ther any file types to isolate for deletion? [1-5]: "
	read -r choice
	echo

	#output array & prompt for spercific target
	case $choice in 		
		1)
			echo "${img_fs[@]}\n"
			echo
			echo -n "Which image file in particular ? [example: .png ]: "
			echo
			read -r d 
				#finds user selection in array
				for i in "${img_fs[@]}\n"; do 
					[[ "$d" == "$i" ]]					
					#deletes group based on filetype
					cat "$trash" > *$( echo "$d")
					mv *$( echo "$d") "$trash"
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
			echo "${sha_fs[@]}\n"
			echo 
			#are there other types of shasum files?
			echo -n "Which shasum file in particular? [example: .sha]: "
			echo
			read -r d
			for i in "${sha_fs[@]}"; do
				[[ "$d" == "$i" ]]
				cat "$trash" > *$( echo "$d")
				mv *$( echo "$d") "$trash"
				break
			done	
			;;
		4)	echo "${windws_fs[@]}\n"
			echo
		 	echo -n "Which windows document in particular ? [example: .doc]"
			echo
			read -r d
			for i in "${windws_fs[@]}"; do 
				[[ "$d" == "$i" ]]
				cat "$trash" > *$( echo "$d")
				mv *$( echo "$d") "$trash"
				break
			done
			;;
		# 5)
		# 	echo -n "${iso_fs[@]}	"	
		# 	;;
	esac


}

group_shred


