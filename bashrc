#custom scripts 
#add to ~/.bashrc
#then restart
PATH=$PATH:~/bin

#set kubectl user variable
export KUBEUSER="youruser"
#set k8s directory
export K8SREPOSITORY=~/k8s-helm
 
kcdesc() {
        kube_desc.sh "$1" "$2"
}

kclog() {
        kube_logs.sh "$1" "$2"
}

kcgetlog() {
	kube_get_logs.sh "$1" "$2"
}
kcpods() {
        kube_pods.sh "$1" "$2"
}

ttl() {
        ttl.sh
}

kcfix() {
        kube_mono_fix.sh
}

mkuser() {
        make_user.sh
}

vpn() {
        vpn.sh "$1"
}

kcdelete() {
         kube_delete.sh "$1" "$2"
}

kcexec() {
        kube_exec.sh "$1" "$2"
}

kcrun() {
	kube_run.sh "$1" "$2" "$3"
}
kcrundef() {
	kube_run_def.sh "$1" "$2" "$3"
}
