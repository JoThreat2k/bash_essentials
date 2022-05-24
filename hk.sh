#!/bin/bash

'''
 A houskeeping script to manage the downloads directory
 Author: Psudojo 
'''
#functions
bleach(){
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
	echo "3 = Hash Files"
	echo "4 = Windows Files"
	echo "5 = Image Files"
	echo " "
	echo -n "[+]For starters, are there any file types to isolate for deletion? [1-5]: "
	read -r choice
	echo

	#output array & prompt for specific target
	case $choice in 		
		1)
			echo "${pic_fs[@]}"
			echo
			echo "[+]Which  picture file type in particular ? [example: .png]"
			read -r d
			echo " "
			echo "[+]Are you sure you want to delete these files?"
			echo "------------------------------------------"
			echo "$(ls *$d)"
			echo "------------------------------------------"
			echo "[y or n]:"
			read -r a 
			if [[ "$a" == "y" ]];then 
				#for every element in array
				for i in "${pic_fs[@]}"; do 
					[[ "$d" == "$i" ]]					
					#deletes group based on filetype
					sudo rm $(echo *"$d")
				done 
			else 
				:	
			fi	
			;;
		2) 
			echo "${compressed_fs[@]}"
			echo
			echo -n "[+]Which compressed file type in particular ? [example: .zip ]"
			read -r d
			echo "[+]Are you sure you want to delete these files?"	
			echo "------------------------------------------"
			echo "$(ls *$d)"
			echo "------------------------------------------"
			echo "[y or n]:"
			read -r a
			if [[ "$a" == "y" ]];then
				for i in "${compressed_fs[@]}"; do
					[[ "$d" == "$i" ]]
					sudo rm $(echo *$d)
					break
				done
			else
				:
			fi 
			;;
		3)
			echo "${hash_fs[@]}"
			echo 
			echo -n "[+]Which encryption file type in particular? [example: .sha256]: "
			echo
			read -r d
			echo "[+]Are you sure you want to delete these files?"	
			echo "------------------------------------------"
			echo "$(ls *$d)"
			echo "------------------------------------------"
			echo "[y or n]:"
			read -r a
			if [[ "$a" == "y" ]];then
				for i in "${hash_fs[@]}"; do
					[[ "$d" == "$i" ]]
					sudo rm $(echo *$d)
					break
				done	
			else
				:
			fi
			;;
		4)	echo "${windws_fs[@]}"
			echo
		 	echo -n "[+]Which windows file type in particular ? [example: .doc]"
			echo
			read -r d
			echo "[+]Are you sure you want to delete these files?"	
			echo "------------------------------------------"
			echo "$(ls *$d)"
			echo "------------------------------------------"
			echo "[y or n]:"
			read -r a
			if [[ "$a" == "y" ]];then 
				for i in "${windws_fs[@]}"; do 
					[[ "$d" == "$i" ]]
					sudo rm $(echo *$d)
					break
				done
			else
				:
			fi
			;;
		5)	echo "${iso_fs[@]}"
			echo
			echo -n "[+]Which image file type in particular ? [Example : .iso]"
			echo
			read -r d
			echo "[+]Are you sure you want to delete these files?"	
			echo "------------------------------------------"
			echo "$(ls *$d)"
			echo "------------------------------------------"
			echo "[y or n]:"
			read -r a
			if [[ "$a" == "y" ]];then  	
				for i in "${iso_fs[@]}"; do	
					[[ "$d" == "$i" ]]
					sudo rm $(echo *$d)
					break
				done
			else
				:
			fi
			;;
		*) 
			echo -n "[*]Not a valid entry"
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
				;;
			esac	
				
	
	fi
}

ss_handler(){
	ss_renamer(){
		# renames screenshots to better format
	}

	ss_cleaner(){
		#a function that only cleans meta data of "${img_fs}" using exif tool 
	}
}

#main code
echo -n "[+]Welcome to Housekeeping, please choose your option:"
echo "1. Delete Files"
echo "2. Sort Files"
echo "3. Handle Screenshots"
read -r c
case $c in
	1)
		bleach()
		;;
	2)
		file_move()
		;;
	3)
		ss_handler()
		;;
	*) echo "Not a valid choice"
		;;
esac
