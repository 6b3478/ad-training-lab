#!/bin/bash
START_PATH=$(pwd)

create_templates(){

    for directory in $(ls -d */); do
        cd $directory
        packer init .
        echo "[+] building template in: $(pwd)"
        packer build .
        cd ..
    done;
    
}

aria2c https://releases.ubuntu.com/24.04.2/ubuntu-24.04.2-live-server-amd64.iso
mkdir ubuntu-server/iso 2> /dev/null
mv *.iso ubuntu-server/iso/

aria2c https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66750/19045.2006.220908-0225.22h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso
aria2c https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso
mkdir win10/iso 2> /dev/null
mv *.iso win10/iso/

aria2c https://software-download.microsoft.com/download/pr/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso
aria2c https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win.iso
mkdir win2019/iso 2> /dev/null
mv *.iso win2019/iso/

create_templates

echo "[+] run the task_terraforming.sh in terraform/"
