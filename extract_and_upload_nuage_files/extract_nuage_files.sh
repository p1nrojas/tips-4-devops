#!/bin/sh
# Author: Mauricio Rojas

display_usage() {
    echo "\nUsage:${0} [folder] [release: i.e 40r9 ] \n"
    }

function extract_file {
    TEMP=`tar -tf $1 | grep "$2"`
    tar xvf $1 $TEMP
    if [ -z $5 ]; then
         mv $TEMP ${EXTRACTED_DIR}/$3${RELEASE}.$4
         echo "mv $TEMP ${EXTRACTED_DIR}/$3${RELEASE}.$4"
    else
         mv $TEMP ${EXTRACTED_DIR}/$3${RELEASE}.$4
         rmdir $5
         echo "mv $TEMP ${EXTRACTED_DIR}/$3${RELEASE}.$4"
    fi
    sleep 1
    }

# if less than one arguments supplied, display usage
    if [  $# -le 1 ]
    then
        display_usage
        exit 1
    fi

# check whether user had supplied -h or --help . If yes display usage
    if [[ ( $# == "--help") ||  $# == "-h" ]]
    then
        display_usage
        exit 0
    fi

# Parameters
cd ${1}
RELEASE=${2}
EXTRACTED_DIR=./extracted_files
mkdir ${EXTRACTED_DIR}

# Extracting VSC
extract_file `ls | grep VSC` vsc_singledisk.qcow2  vsc qcow2 ./single_disk
extract_file `ls | grep VSD | grep QCOW` qcow2 vsd qcow2
extract_file `ls | grep NSG` qcow2 nsg qcow2
extract_file `ls | grep VRS | grep el7` ".*openvswitch-[4-5].*rpm" nuage-openvswitch rpm
extract_file `ls | grep Docker` "rpm" docker-monitor rpm
extract_file `ls | grep "elastic-[4-5]"` ".*qcow2$" elastic qcow2
extract_file `ls | grep kube` "nuage-k8s-plugin" nuage-k8s-plugin rpm
extract_file `ls | grep kube` "nuagekubemon" nuagekubemon rpm
extract_file `ls | grep Util` ".*qcow2$" util qcow2
extract_file `ls | grep "uage-openstack-[4-5]"` "mitaka.*nuage-openstack-neutronclient.*rpm" nuage-openstack-neutronclient rpm  ./mitaka/el7
extract_file `ls | grep "uage-openstack-[4-5]"` "mitaka.*nuagenetlib.*rpm" nuagenetlib rpm ./mitaka/el7
extract_file `ls | grep "uage-openstack-[4-5]"` "mitaka.*nuage-openstack-neutron-.*rpm" nuage-openstack-neutron rpm ./mitaka/el7
extract_file `ls | grep "uage-openstack-[4-5]"` "mitaka.*nuage-openstack-horizon.*rpm" nuage-openstack-horizon rpm ./mitaka/el7
extract_file `ls | grep "uage-openstack-[4-5]"` "mitaka.*nuage-openstack-heat.*rpm" nuage-openstack-heat rpm ./mitaka/el7
extract_file `ls | grep "uage-openstack-[4-5]"` "mitaka.*nuage-nova-esxi.*rpm" nuage-nova-esxi rpm ./mitaka/el7
extract_file `ls | grep libnetwork` libnetwork libnetwork  rpm

