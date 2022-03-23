#! /bin/bash
#This is just a quick script I put together to install some of the tools that might be used on assessment. Because I'm lazy.
#TODO Add phishihg template repo?


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

cd $current_dir
#apt downloads
apt install ipcalc -y
apt install rsh-client
apt install faker -y
echo "Don't forget to run wes.py --update to update the wesng database!"
echo "Done. Have fun!"
}

folder_check
