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


	#file_types=("")
	
	#file types
 	img_fs=('.png' '.jpg' '.jpeg' '.pdf' '.ai' '.bmp' '.ico' '.ps' '.psd' '.svg' '.tiff' '.tif')
	compressed_fs=('.zip' '.bz2' '.tar' '.deb' '.xz' '.pkg' '.rar') 
	sha_fs=('.sha')
	windws_fs=('.doc' '.docx')
	iso_fs=('.iso' '.img')
	
	# prompt user for group to send to shredder 
	echo "1 = Picture Files"
	echo "2 = Compressed Files" 
	echo "3 = .sha Files"
	echo "4 = Windows Files"
	echo "5 = Iso Files"
	echo " "
	echo -n "[+] For starters, are ther any file types to isolate for deletion? [1-4]: "
	read -r choice
	echo


	#output array & prompt for spercific target
	case $choice in 
		
		1)
			echo "${img_fs[@]}"
			echo -n "which image file in particular ? [example: .png ] : "
			read -r d 
				#delete specific group based on user decision
				if [[ $d == '.png' ]]; then
					cat /dev/null > "*${img_fs[0]}"
					mv  "*${img_fs[0]}" /dev/null
				elif [[ $d == '.jpg' ]]; then
					cat /dev/null > "*${img_fs[1]}"
					mv  "*${img_fs[1]}" /dev/null
				elif [[ $d == '.jpeg' ]]; then
					cat /dev/null > "*${img_fs[2]}"
					mv  "*${img_fs[2]}" /dev/null
				elif [[ $d == '.pdf' ]]; then
					cat /dev/null > "*${img_fs[3]}"
					mv  "*${img_fs[3]}" /dev/null
				elif [[ $d == '.ai' ]]; then
					cat /dev/null > "*${img_fs[4]}"
					mv  "*${img_fs[4]}" /dev/null
				elif [[ $d == '.bmp' ]]; then
					cat /dev/null > "*${img_fs[5]}"
					mv  "*${img_fs[5]}" /dev/null
				elif [[ $d == '.ico' ]]; then
					cat /dev/null > "*${img_fs[6]}"
					mv  "*${img_fs[6]}" /dev/null
				
				fi
			;;
		2) 
			echo "${compressed_fs[@]}"
			echo -n "which Compressed file in particular ? [example: .zip ] : "
			read -r d 
				#delete specific group based on user decision
				#cat /dev/null > "${compressed_fs[@]}" works 
				if [[ $d == '.zip' ]]; then
					cat /dev/null > "*${compressed_fs[0]}"
					mv  "*${compressed_fs[0]}" /dev/null
				elif [[ $d == '.bz2' ]]; then
					cat /dev/null > "*${compressed_fs[1]}"
					mv  "*${compressed_fs[1]}" /dev/null
				elif [[ $d == '.tar' ]]; then
					cat /dev/null > "*${compressed_fs[2]}"
					mv  "*${compressed_fs[2]}" /dev/null
				elif [[ $d == '.deb' ]]; then
					cat /dev/null > "*${compressed_fs[3]}"
					mv  "*${compressed_fs[3]}" /dev/null
				fi
			;;
		3)
			echo -n "${sha_fs[@]}	"
			;;
		4) 
		 	echo -n "${windws_fs[@]}	"
			;;
		5)
			echo -n "${iso_fs[@]}	"	
			;;
	esac


}

group_shred


