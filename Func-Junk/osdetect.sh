#!/bin/bash -

#osdetect.sh
#Description: Distunguish between MS-windows/Linux/MacOS
#Usage: bash osdetect.sh#output will be one of: Linux MSwin macOS
#output will be one of: Linux MSwin macOS

# checks for command 

oscheck(){

	if type -t wevtutil &> /dev/null
		then
			OS=MSwin
	elif type -t scutil &> /dev/null

		then
    		OS=macOS
   			real_os="$(uname -s)"
			echo $OS "aka $real_os"
			exit 
	else 
    		OS=Linux
	fi
	echo $OS
}

oscheck 

