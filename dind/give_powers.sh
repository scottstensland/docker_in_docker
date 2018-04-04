#!/bin/bash

new_username=$1

sudoers_file=/etc/sudoers

function give_user_sudo_powers() {

    given_user=$1

    given_sudoers_file=$2

    if [ -e ${given_sudoers_file}.tmp -o "$(pidof visudo)" ]; then
        echo "ERROR - ${given_sudoers_file} busy, try again later"
        # exit 1
        return
    else
        echo OK we can proceed editing sudoers file
    fi

    cp ${given_sudoers_file} ${given_sudoers_file}.backup.${curr_timestamp}
    cp ${given_sudoers_file} ${given_sudoers_file}.tmp

    chmod 0640 ${given_sudoers_file}.tmp
    new_entry="${given_user} ALL=(ALL) NOPASSWD: NOPASSWD: ALL "
    echo here is sudoers_file new_entry
    echo $new_entry
    echo "${new_entry}" >> ${given_sudoers_file}.tmp
    chmod 0440 ${given_sudoers_file}.tmp

    if visudo -c -f ${given_sudoers_file} ; then

        echo OK syntax on ${given_sudoers_file}
    else
        echo "ERROR - syntax check failed on file ${given_sudoers_file}"
        # exit -5
        return
    fi

    mv ${given_sudoers_file}.tmp ${given_sudoers_file}
}

give_user_sudo_powers ${new_username}   ${sudoers_file}

# ... now give docker power

sudo usermod -aG docker  ${new_username} 

echo "here is sudoers_file  -->${sudoers_file}<-- "
echo
# echo "cat  ${sudoers_file}"
#       cat  ${sudoers_file}

