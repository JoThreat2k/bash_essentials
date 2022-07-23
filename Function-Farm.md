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
- deletes contents of a file while preserving the file itself
```bash
#if there are no arguments
whtout(){
	if [[ $# -eq 0 ]];then
		echo "A quick script that deletes file contents by overwriting /n"
		echo "Usage: ./whtout [filename]"		
#when there is an argument
	else
		cat /dev/null > "$1"
		echo "$1 DELETED"
		rm "$1"
			
	fi
}
```
**file_chkr**
- checksum checker for the .rc file 
```bash
file_chkr(){

        t="/tmp/fc"

        sha256sum $1 > "${t}" ; sha256sum -c "${t}" || echo "error"
}
```