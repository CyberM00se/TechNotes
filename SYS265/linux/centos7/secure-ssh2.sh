#!/bin/bash
# Create a new user with ssh key

function println()
{
   echo "-------------------------"
}

println
echo "Creating User: $1"
useradd -m -d /home/$1 -s /bin/bash $1
println
echo "Creating $1's ssh folder"
mkdir /home/$1/.ssh
println
echo "Creating authorized key folder"
touch /home/$1/.ssh/authorized_keys
println
echo "copying the public key from the repo to the auhorized key destination"
sudo cp /home/noah/TechNotes/SYS265/linux/public-keys/mykey.pub /home/$1/.ssh/authorized_keys
println
echo "setting security perms on ssh folder"
sudo chmod 700 /home/$1/.ssh
println
echo "setting security perms on authrozied keys folder"
sudo chmod 600 /home/$1/.ssh/authorized_keys
println
echo "Change the owner of the folder to actual user $1"
sudo chown -R $1:$1 /home/$1/.ssh
