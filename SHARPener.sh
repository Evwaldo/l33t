#!/bin/bash
# This should fix the sharphound jsmin issue that it always complains about. 
#I got sick of having to Google the solution each time.

apt install wget -y

current= pwd
cd /tmp
sudo wget https://files.pythonhosted.org/packages/17/73/615d1267a82ed26cd7c124108c3c61169d8e40c36d393883eaee3a561852/jsmin-2.2.2.tar.gz
tar xzf jsmin-2.2.2.tar.gz
cd jsmin-2.2.2
sudo python2 setup.py install
cd $current
echo "Done."
