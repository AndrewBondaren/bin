#custom scripts 
#add to ~/.bashrc
#then restart
PATH=$PATH:~/bin
#set kubectl user variable
export KUBEUSER="youruser"
 
kcdesc() {
        kube_desc.sh "$1" "$2"
}

kclogs() {
        kube_logs.sh "$1" "$2"
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
        vpn.sh
}

kcdelete() {
         kube_delete.sh "$1" "$2"
}

kcexec() {
        kube_exec.sh "$1" "$2"
}

