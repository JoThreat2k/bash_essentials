# Function-Farm 🐔🐮🐷
### a collection of my favorite functions 

**os detect**
- Distinguishes between MS-windows/Linux/MacOS
```bash
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
```

**whtout**
- deletes contents of a file while preserving the file
```bash
#if there are no arguments
whtout(){
	if [[ $# -eq 0 ]];then
		echo "A quick script that deletes file contents by overwriting /n"
		echo "Usage: ./whtout [filename]"		
#when there is an argument
	else
		cat /dev/null > "$1"
		echo "[+] $1 SCRUBBED"
		rm -i "$1"
			
	fi
}
```
**file_chkr**
- checksum checker 
```bash
file_chkr(){
	#if no arguments input
	if [[$# -eq 0]];then
		echo "A quick way to check a files checksum \n"
		echo "Usage: file_chkr [file] [checksum file]"
	else
		t="/tmp/fc"

		#prompt user for algorithm
		echo -n "[+] choose algorithm [ex. 256, 1, 512]: "
		read -r p
		shasum -a $p $1 > "${t}" ; diff -w "{t}" $2

		#check exit code
		if [[ $? -eq 0 ]]; then
			echo "\n [+] CHECK PASSED !!"
		else
			echo "\n [+] CHECK FAILED !!"
		fi
	fi
}
```
**backup a file**
- backup file using argument as selection
```bash
backup(){
        cp $1 $1.bak
        echo "[+]BACKUP SUCCESSFUL!"
        echo -n "[+]Would you like to save to a differnt directory? [y or n]: "
        read -r a
        if [[ "$a" == "y" ]]; then
                echo -n "enter literal directory path: "
                read -r p
                mv $1.bak $p/$1.bak
                echo "[+]DONE!"
        else
                exit
        fi
}
```

