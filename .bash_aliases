alias three="xrandr --setprovideroutputsource 1 0 && xrandr --setprovideroutputsource 2 0 && xrandr --setprovideroutputsource 3 0 && xrandr --setprovideroutputsource 4 0 && xrandr --output DVI-I-1-1 --auto --below DP-2"
alias two="xrandr --output DVI-I-1-1 --off"

alias mytmux='tmux new -s beed2112'
alias mouseoff='tmux set -g mouse off'
alias mouseon='tmux set -g mouse on'
alias obsidian="~/applications/Obsidian-1.2.8.AppImage --no-sandbox"



alias myperms='sudo chown -R beed2112 ~/hackclub/; sudo chgrp -R beed2112 ~/hackclub/'

alias woprconnect='globalprotect connect --portal lab.woprnet.org'
alias woprdisconnect='globalprotect disconnect --portal lab.woprnet.org'
alias woprauto='~/woprauto.exp'

alias fuzzdirs='wfuzz -w $WORDLIST -t 50 --hc 403,404 -v -c -f $RHOST.DIRS.$WORDLISTSHORT.txt,raw http://$RHOST/FUZZ '
alias fuzzvhosts='wfuzz -w $WORDLIST -t 50 -u http://$RHOST --hc 301 -v -c -f $RHOST.VHOSTS.$WORDLISTSHORT.txt,raw -H "Host:FUZZ.$RHOST"'  


alias bigdirectories='export WORDLIST=/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt;export WORDLISTSHORT=raft-large-directories'
alias mediumdirectories='export WORDLIST=/usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt;export WORDLISTSHORT=raft-medium-directories'
alias smalldirectories='export WORDLIST=/usr/share/seclists/Discovery/Web-Content/raft-small-directories.txt;export WORDLISTSHORT=raft-small-directories'

alias bigsubdomains='export WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt;export WORDLISTSHORT=subdomains-top1million-110000'
alias mediumsubdomains='export WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt;export WORDLISTSHORT=subdomains-top1million-20000'
alias smallsubdomains='export WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt;export WORDLISTSHORT=subdomains-top1million-5000'

alias enchilada='date | tee $RHOST.big.run; bigsubdomains;fuzzvhosts;date | tee -a $RHOST.big.run; bigdirectories;fuzzdirs;date | tee -a $RHOST.big.run; niktoit;date | tee -a $RHOST.big.run'
alias bigenchilada='date | tee $RHOST.big.run; bigsubdomains;fuzzvhosts;date | tee -a $RHOST.big.run; bigdirectories;fuzzdirs;date | tee -a $RHOST.big.run; niktoit;date | tee -a $RHOST.big.run'
alias mediumenchilada='date | tee $RHOST.medium.run; mediumsubdomains;fuzzvhosts;date | tee -a $RHOST.medium.run; mediumdirectories;fuzzdirs;date | tee -a $RHOST.medium.run; niktoit;date | tee -a $RHOST.medium.run'
alias smallenchilada='date | tee $RHOST.small.run; smallsubdomains;fuzzvhosts;date | tee -a $RHOST.small.run; smalldirectories;fuzzdirs;date | tee -a $RHOST.small.run; niktoit;date | tee -a $RHOST.small.run'
alias prettyoutput='~/prettyoutput.sh'


alias niktoit='nikto -host http://$RHOST | tee $RHOST.NIKTO.txt'



alias httpdpy='python3 -m http.server'
alias toolserver='cd ~/targetTools; python3 -m http.server 5150'

alias autorecondocker='docker run --rm --network host -t -v "${PWD}:/results" -v "/usr/share/seclists:/seclists" suezawa/autorecon' 
alias autoreconconsole='docker run  --rm --network host -it --entrypoint=/bin/bash -v /"${PWD}:/results" -v "/usr/share/seclists:/seclists" suezawa/autorecon'

alias dockershell='docker run --rm -it --entrypoint=/bin/bash'
alias dockershellsh='docker run --rm -it --entrypoint=/bin/sh'

alias impacketpython3='docker run  --rm --network host  -it -v "${PWD}:/results" -v "${HOME}/targetTools:/mystuff" -v "/usr/share/seclists:/seclists" rflathers/impacket'
alias impacketconsole3='docker run  --rm --network host -i -t --entrypoint=/bin/sh -v "${PWD}:/myhome" -v "${HOME}/targetTools:/mystuff" -v "/usr/share/seclists:/seclists" rflathers/impacket'

alias impacketpython2='docker run  --rm -it --network host -v "${HOME}/targetTools:/mystuff" -v "/usr/share/seclists:/seclists" impacket'
alias impacketconsole2='docker run   --rm -it --network host --entrypoint=/bin/sh -v "${HOME}/targetTools:/mystuff" -v "/usr/share/seclists:/seclists" impacket'

alias ffufdocker='docker run  --rm -it --network host -v $(pwd):/var/reports -v "/usr/share/seclists:/seclists" ffuf-docker -recursion -recursion-depth 5 -t 200 -r -recursion-strategy greedy -u http://$RHOST/FUZZ' 

alias evilwinrm='docker run --rm -ti --network host  -v "${HOME}/targetTools/ps1_scripts:/ps1_scripts" -v "${HOME}/targetTools/exe_files:/exe_files" -v "${HOME}/targetTools/harvested:/data" oscarakaelvis/evil-winrm  -s '/ps1_scripts/' -e '/exe_files/' -i $TARGET -u "$TARGETID" -p "$TARGETPASS"'
alias evilwinrmconsole='docker run --rm  --network host --entrypoint=/bin/bash -ti -v "${HOME}/targetTools/ps1_scripts:/ps1_scripts" -v "${HOME}/targetTools/exe_files:/exe_files" -v "${HOME}/targetTools/harvested:/data" oscarakaelvis/evil-winrm  -s '/ps1_scripts/' -e '/exe_files/''

alias feroxbusterdocker='docker run --rm -it --network host -v "${PWD}:/results" -v "/usr/share/seclists:/seclists" epi052/feroxbuster --force-recursion -u http://$RHOST'
alias feroxbusterdockerconsole='docker run --rm -it --entrypoint=/bin/bash -v "${PWD}:/results" --network host -v "/usr/share/seclists:/seclists" epi052/feroxbuster -'

alias hydradocker='docker run --rm --network host -t -v "${PWD}:/results" -v "/usr/share/seclists:/seclists" tarampampam/hydra:9.3.0'
alias hydradockerconsole='docker run --rm --network host -it --entrypoint=/bin/sh -v "${PWD}:/results" -v "/usr/share/seclists:/seclists" tarampampam/hydra:9.3.0'

alias metasploitdocker='docker run --network host -it --rm metasploitframework/metasploit-framework'
alias msfvenomdocker='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfvenom'

alias burpdocker='docker run -d --name burpsuite -e DISPLAY -v ${HOME}:/home/burpsuite -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /etc/localtime:/etc/localtime:ro -p 8080:8080 alexandreoda/burpsuite'

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
#vulnerable images
alias dvwa='docker run --name dvwa --rm -it -p 80:80 vulnerables/web-dvwa'


alias offsec='sudo openvpn /home/beed2112/pen-200/universal.ovpn'
