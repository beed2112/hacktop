smbservehere() {
    local sharename
    [[ -z $1 ]] && sharename="SHARE" || sharename=$1
    docker run --rm -it  --network host -p 445:445 -v "${PWD}:/tmp/serve" rflathers/impacket smbserver.py -smb2support $sharename /tmp/serve
}

# get a list of the docker aliases define
dockerstuff() {
  for line in `alias | grep docker | grep run | sed 's/=/ /' | awk '{print $2}'`;
    do 
      echo $line
   done
}

scanit ()
 {
 export IP="$1"
 nmap  -Pn -T4 -sT -sV -sC --version-all -p- -oA $IP $IP
 }

gobusterit ()
 {
 gobuster dir -u http://$targetIP/ -w /usr/share/dirbuster/wordlists/directory-list-2.3-small.txt -z -t 20
 }
