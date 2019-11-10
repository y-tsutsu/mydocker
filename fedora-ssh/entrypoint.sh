#!/bin/bash

create_rundir() {
    mkdir -p /var/run/sshd
}

create_hostkeys() {
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
}

create_user() {
    echo -e "hogepiyo\nhogepiyo" | (passwd --stdin root)
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
}

create_rundir
create_hostkeys
create_user

exec "$@"
