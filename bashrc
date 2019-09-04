#custom scripts 
#add to ~/.bashrc 
kcdesc() { 
	kube_desc.sh "$1" "$2" 
}

kclogs() { 
	kube_logs.sh "$1" "$2" 
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

kcrun() { 
	kube_run.sh "$1" "$2" 
}

hosts() { 
	hosts.sh 
}


