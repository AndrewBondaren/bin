#custom scripts 
#add to ~/.bashrc
#then restart
PATH=$PATH:~/bin

#set kubectl user variable
export KUBEUSER="youruser"
#set k8s directory
export K8SREPOSITORY=~/k8s-helm
 
kcds() {
        kube_desc.sh "$1" "$2"
}

kclog() {
        kube_logs.sh "$1" "$2"
}

kcglog() {
	kube_get_logs.sh "$1" "$2"
}
kcpods() {
        kube_pods.sh "$1" "$2"
}

ttl() {
        ttl.sh
}

kcfx() {
        kube_mono_fix.sh
}

mkuser() {
        make_user.sh
}

vpn() {
        vpn.sh "$1"
}

kcdel() {
         kube_delete.sh "$1" "$2"
}

kcex() {
        kube_exec.sh "$1" "$2"
}

kcrun() {
	kube_run.sh "$1" "$2" "$3"
}
kcrundf() {
	kube_run_def.sh "$1" "$2" "$3"
}
kclogsv() {
	kube_logs_save.sh "$1" "$2"
}
