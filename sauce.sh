#! /bin/bash
#RUN WITH SUDO!
#This is just a quick script I put together to install some of the tools that might be used on assessment. Because I'm lazy.
#TODO Add phishihg template repo, and add payload encoding functions. Need to fix cme alias issue.


function folder_check () {
#Check to see if folder exists
if [ -d "/root/Desktop/tools/" ]
then
	echo "Sorry, looks like this script has already been ran! Exiting to avoid any confusion. Delete /root/Desktop/tools directory and try again."
	exit
else
	mkdir "/root/Desktop/tools/"
	echo "Created directory /root/Desktop/tools/"
	download_files
fi
}

function download_files () {
#github downloads
current_dir= pwd
cd /root/Desktop/tools/
git clone https://github.com/topotam/PetitPotam.git
git clone https://github.com/SnaffCon/Snaffler.git
git clone https://github.com/s0lst1c3/eaphammer.git
git clone https://github.com/lgandx/Responder.git
git clone https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS/winPEASexe
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/InteliSecureLabs/Linux_Exploit_Suggester.git
git clone https://github.com/bitsadmin/wesng --depth 1
#Don't forget to run wes.py --update to update the wesng database!
git clone https://github.com/login-securite/DonPAPI





cd $current_dir
#apt downloads
apt update -y
apt install ipcalc -y
apt install rsh-client
apt install faker -y #Allows for the creation of fake SSNs and Credit card numbers for egress testing.
apt install python3-pip -y #Needed for DonPapi and CME
python3 -m pip install -r /root/Desktop/tools/DonPAPI/requirements.txt

#cme comes installed on the kali boxes we use, but lately has had some issues. This will install the latest python3 version, which is better anyways.
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec
echo 'alias cme="crackmapexec"' >> ~/.bash_aliases


echo "Don't forget to run wes.py --update to update the wesng database!"
echo "IMPORTANT: Run the command: source ~/.bash_aliases"
echo "Otherwise you will have to type crackmapexec instead of cme, which is a pain."
echo "Happy Hacking!"
}

folder_check
