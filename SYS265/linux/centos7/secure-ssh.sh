#!/bin/bash
#secure-ssh
#author noah
#Create a new ssh user using $1 parameter
#adds a public key from the local reop or curled form the remote repo
# removes root ability to ssh in
# code goes here

$username
$var
function createUser()
{
  echo "--------------------"
  echo "Creating New User!"
  echo "--------------------"
  echo "Username: "
  read username
  
 
  #Create a user
  adduser $username
  echo "Adding User: $username"
  # add the user to the wheel group
  usermod -a -G wheel $username
  echo "--------------------"
  echo "Secure profile ssh? y / n"
  read var

  if [ "$var" == "y" ]
  then
    echo securing your user for ssh!
    secureSSH
  else
    listUser
  fi
}

function secureSSH()
{
  echo "-----------------------"
  echo "SecuringSSH"
  #Disable Root SSH
  sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config #remove the comment
  echo "Restarting sshd"
  systemctl restart sshd
  echo -ne "#####           (33%)\r"
  sleep 1
  echo -ne "############    (66%)\r"
  sleep 1
  echo -ne "################(100%)\r"
  echo -ne "\n"
  systemctl status sshd
  listUser
}

function listUser()
{
  echo "-----------------------"
  echo "Listing User: $username"
  awk -F: '{ print $1}' /etc/passwd
}

createUser
