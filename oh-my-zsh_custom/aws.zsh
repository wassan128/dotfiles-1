sshec2() {
    [ $# -eq 0 ] && local _IP=`aws ec2 describe-instances | jq -r '.Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].Association.PublicIp'` && echo $_IP
    ssh -l ec2-user -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -i ~/.ssh/AWS_Tokyo_K_OSX.pem ${1:-$_IP}
}
