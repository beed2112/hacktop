alias three="xrandr --setprovideroutputsource 1 0 && xrandr --setprovideroutputsource 2 0 && xrandr --setprovideroutputsource 3 0 && xrandr --setprovideroutputsource 4 0 && xrandr --output DVI-I-1-1 --auto --below DP-2"
alias two="xrandr --output DVI-I-1-1 --off"

alias mytmux='tmux new -s beed2112'
alias mouseoff='tmux set -g mouse off'
alias mouseon='tmux set -g mouse on'
alias obsidian="~/applications/Obsidian-1.2.8.AppImage --no-sandbox"



alias myperms='sudo chown -R beed2112 .; sudo chgrp -R beed2112 .'




alias fuzzdirs='wfuzz -w $WORDLIST -t 50 --sc 200,301 -v -c -f $targetHTTP.DIRS.$WORDLISTSHORT.txt,raw http://$targetHTTP/FUZZ '
alias fuzzvhosts='wfuzz -w $WORDLIST -t 50 -u http://$targetHTTP --hc 404 -v -c -f $targetHTTP.VHOSTS.$WORDLISTSHORT.txt,raw -H "Host:FUZZ.$targetHTTP"'  


alias bigdirectories='export WORDLIST=/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt;export WORDLISTSHORT=raft-large-directories'
alias mediumdirectories='export WORDLIST=/usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt;export WORDLISTSHORT=raft-medium-directories'
alias smalldirectories='export WORDLIST=/usr/share/seclists/Discovery/Web-Content/raft-small-directories.txt;export WORDLISTSHORT=raft-small-directories'

alias bigsubdomains='export WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt;export WORDLISTSHORT=subdomains-top1million-110000'
alias mediumsubdomains='export WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-20000.txt;export WORDLISTSHORT=subdomains-top1million-20000'
alias smallsubdomains='export WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt;export WORDLISTSHORT=subdomains-top1million-5000'

alias enchilada='date | tee $targetHTTP.big.run; bigsubdomains;fuzzvhosts;date | tee -a $targetHTTP.big.run; bigdirectories;fuzzdirs;date | tee -a $targetHTTP.big.run; niktoit;date | tee -a $targetHTTP.big.run'
alias bigenchilada='date | tee $targetHTTP.big.run; bigsubdomains;fuzzvhosts;date | tee -a $targetHTTP.big.run; bigdirectories;fuzzdirs;date | tee -a $targetHTTP.big.run; niktoit;date | tee -a $targetHTTP.big.run'
alias mediumenchilada='date | tee $targetHTTP.medium.run; mediumsubdomains;fuzzvhosts;date | tee -a $targetHTTP.medium.run; mediumdirectories;fuzzdirs;date | tee -a $targetHTTP.medium.run; niktoit;date | tee -a $targetHTTP.medium.run'
alias smallenchilada='date | tee $targetHTTP.small.run; smallsubdomains;fuzzvhosts;date | tee -a $targetHTTP.small.run; smalldirectories;fuzzdirs;date | tee -a $targetHTTP.small.run; niktoit;date | tee -a $targetHTTP.small.run'
alias prettyoutput='~/prettyoutput.sh'


alias niktoit='nikto -host http://$targetHTTP | tee $targetHTTP.NIKTO.txt'



alias httpdpy='python3 -m http.server'
alias toolserver='cd ~/targetTools; python3 -m http.server 5150'


alias mysteps='code ~/Documents/steps/'



alias nasmount='sudo mount -t nfs 192.168.0.250:/volume1/homes /media/freewill'
alias musicBox='xfreerdp /u:beedlow /p:beedlow /audio-mode:  /v:192.168.0.134'
alias mywpscan='wpscan --enumerate --api-token TRoV0YSbxfGSlk8AnKAavrZxXrskGaly7ag3gszkKIQ --url '
alias mywebserver='docker run -it --rm -p 8080:8000  -v $PWD:/app/public  --name gohttpserver docker.io/codeskyblue/gohttpserver:latest --upload'

alias penelope.py='python3 /home/beed2112/gitspace/penelope/penelope.py' 

alias htbacademy='sudo openvpn /home/beed2112/Downloads/Academy_Lab_beed2112.ovpn'
alias htbcomp='sudo openvpn /home/beed2112/Downloads/competitive_beed2112.ovpn'
alias htbdedicated='sudo openvpn /home/beed2112/Downloads/Dedicated_Lab_beed2112.ovpn'


alias offsec='sudo openvpn /home/beed2112/pen-200/universal.ovpn'


 alias mbloohhoundstart='cd /home/beed2112/docker/blood/;docker-compose up'

 alias rdp='xfreerdp +clipboard /smart-sizing /cert-ignore'
 alias enumSetup='~/enumSetup.sh'
 alias attackerIP='export attackerIP=$(ip addr show dev tun0 | awk "/inet /{split(\$2, a, \"/\"); print a[1]}");echo $attackerIP'

alias SS='flameshot gui --path  ${PWD}/report/screenshots'

alias cme='crackmapexec'
alias visualize='docker run -d --name webmap -h webmap -p 8000:8000 -v $PWD/scans/xml:/opt/xml reborntc/webmap'
alias targetIP='export targetIP=`cat box`;echo $targetIP'