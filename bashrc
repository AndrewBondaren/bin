PATH=$PATH:~/bin
export KUBEUSER="youruser"
export K8SREPOSITORY=~/k8s-helm
export CONFREP=~/minikube
export KUBECONFIG=$CONFREP/$KUBEUSER/config

mkuser() {
        make_user.sh $1
}

kcpods() {
        kube_pods.sh "$1"
}

kcrun() {
	kube_run.sh "$1" "$2" "$3"
}
 
kcrundf() {
	kube_run_def.sh "$1" "$2" "$3"
}

kcdel() {
         kube_delete.sh "$1" "$2"
}
 
kcds() {
        kube_desc.sh "$1" "$2"
}

kclog() {
        kube_logs.sh "$1" "$2"
}

kclogsv() {
	kube_logs_save.sh "$1" "$2"
}
  
kclogsf() {
	kube_logs_f.sh "$1" "$2"
}

kcglog() {
	kube_get_logs.sh "$1" "$2"
}

kcex() {
        kube_exec.sh "$1" "$2"
}

kcfx() {
        kube_mono_fix.sh
}

ttl() {
        ttl.sh
}

vpn() {
        vpn.sh "$1"
}

alias gs='git status'
alias gd='git diff'
alias co='git checkout'
alias gc='git commit -am'
