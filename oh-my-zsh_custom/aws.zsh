. /usr/local/share/zsh/site-functions/_aws
sshec2() {
    while getopts :l OPT
    do
        case $OPT in
            l)
                aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | {InstanceId, PrivateIpAddress, PublicAddress: (.NetworkInterfaces[].PrivateIpAddresses[].Association.PublicIp), InstanceName: (.Tags[] | select(.Key=="Name").Value)}'
                return $?
                ;;
        esac
    done
    ssh -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=FATAL -l ec2-user $*
}
