#!/usr/bin/env bash

echo "Updating apt repository"
apt-get -qq update

#echo "Installing prerequisite packages"
#apt-get -qq install git python-dev python-pip \
#	libssl-dev libffi-dev
#
#echo "Installing ansible"
#pip -q install markupsafe
#pip -q install Jinja2==2.8.1
#pip -q install git+git://github.com/ansible/ansible.git@v2.0.0-0.5.beta3

echo "Installing ansible"
apt-get -qq install ansible aptitude

echo "Provisioning using ansible"
cd /vagrant/provisioning
ansible-playbook build_dev_vm.yml
