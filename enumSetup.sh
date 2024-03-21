#!/bin/bash

# Check if the number of parameters is less than 2
if [ $# -lt 2 ]; then
    echo "Usage: $0 <IP_ADDRESS> <HOSTNAME>"
    echo "Example: $0 192.168.1.10 example.com"
    exit 1
fi

# Set filename, entry, and entryip
filename="box"
entry="$2"
entryip="$1"

# Create filename and populate it with entry
echo "$entry" > "$filename"

# Create folders
mkdir exploit
mkdir loot
mkdir report
mkdir report/screenshots
mkdir scans
mkdir scans/xml

# Create empty files
touch report/user.txt
touch report/root.txt
touch report/scratchPad
touch report/notes.Main
touch report/notes.Foothold
touch report/notes.PE
cp ~/reportTodo report/reportTodo
touch loot/users
touch loot/passwords
touch loot/hash

# Create nmap scan script
script_name="nmap-${entry}.sh"
touch "$script_name"
chmod +x "$script_name"

# Populate nmap scan script
cat <<EOF > "$script_name"
#!/bin/bash
echo  ----------------------------------------
echo  begin scanning for open ports
sudo nmap -p- -T5 -Pn $entryip | grep open | awk '{print \$1}' | cut -d '/' -f1 | tr '\n' ',' > "scans/portlist"
sudo nmap -p \$(cat "scans/portlist") -T5 -A -R -O -Pn -oN "scans/fingerprint.txt" -oX "scans/xml/fingerprint.xml" $entryip
echo  ----------------------------------------
echo  begin finger print scan of open ports
echo  ----------------------------------------
echo  begin script scan of open ports
sudo nmap -p \$(cat "scans/portlist") -T5 -sV --version-all --script default,auth,brute,vuln -oN "scans/scripts.txt" -oX "scans/xml/scripts.xml" -Pn $entryip
echo  ----------------------------------------
echo  begin udp scan ports
sudo nmap -T5 -sU --top-ports 60 -oN "scans/udp.txt" -oX "scans/xml/udp.xml" $entryip
EOF

# Create DNS update script
dns_script="dnsupdate-${entry}.sh"
touch "$dns_script"
chmod +x "$dns_script"

# # Populate DNS update script
cat <<EOF > "$dns_script"
#!/bin/bash

# Check if entry exists in /etc/hosts
if grep -q "\<$entry\>" /etc/hosts; then
    # Entry exists, replace the information
    sudo sed -i "s/^.*\<$entry\>.*/$entryip $entry $entry.htb/" /etc/hosts
else
    # Entry doesn't exist, append it to /etc/hosts
    echo "$entryip $entry $entry.htb" | sudo tee -a /etc/hosts
fi
ping $entry -c 3 
EOF



# Print out the names of scripts created
echo "Scripts created:"
echo "scans/$script_name"
echo ""
cat "$script_name"

echo "$dns_script"
echo ""
cat "$dns_script"
echo ""
echo "" 
# Show contents of filename
echo "Contents of $filename:"
cat "$filename"



#cp ~/reportTodo report/reportTodo
# # Populate DNS update script
cat <<EOF > report/reportTodo
To do List

Reference 

https://help.offsec.com/hc/en-us/articles/360040165632-OSCP-Exam-Guide



Document enumeration results with nmap results

Screen shot
 
Document steps to get foothold

        note exploit code location 
        note any modifications and why 
        commands
        console output
        screenshots


Document Local Flag
        ipconfig ifconfig ip addr
        cat/type local.txt             # --->  whoami && ipconfig && type proof.txt
        take screen shot  (make sure user identity shows)
        submit flag 


Document Escalation 
        note exploit code location 
        note any modifications and why 
        commands
        console output
        screenshots


Document Proof Flag
        ipconfig ifconfig ip addr   # --->  whoami && ipconfig && type proof.txt
        cat/type proof.txt
        take screen shot  (make sure user identity shows)
        submit flag 



EOF