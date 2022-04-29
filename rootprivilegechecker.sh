#!/bin/bash

#Get the information of the groups of current user

CURRENT_USER=$(whoami)
GROUPS_LIST=$(getent group | grep "${CURRENT_USER}" | cut -d ":" -f 1)
echo "${GROUPS_LIST}" > group.txt

#Loop through the variable and do the thing

while IFS="@" read -r group
do
    case "${group}" in
    "wheel")
        echo "You have superuser privileges !!!"
    ;;

    "sudo")
        echo "You have superuser privileges !!!"
    ;;

    "root")
        echo "You have superuser privileges !!!"
    ;;

    esac
done < group.txt

#Remove the file group.txt after the script gets completed
rm group.txt