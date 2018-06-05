alias k=kubectl
alias ksys='kubectl -n kube-system'
alias cc1-k8s-tunnel='lsof -i:16443 &> /dev/null || ssh -fNL 16443:k8s-api.k8sp-dsdev1.cc1.ops.yahoo.co.jp:6443 k8s1.kkori.ygrid.cc1.ynwp.yahoo.co.jp'
alias kc='cc1-k8s-tunnel; kubectl --context cc1-k8s'
