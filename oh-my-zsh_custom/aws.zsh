sshec2() {
    [[ $# == 0 ]] && local _IP="`aws ec2 describe-instances | jq -r '.Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].Association.PublicIp' | sed '/null/d'`" && echo $_IP
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -i ~/.ssh/AWS_Tokyo_K_OSX.pem -l ${SSH_USER:-ec2-user} ${1:-$_IP}
}
