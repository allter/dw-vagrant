#!/usr/bin/env bash

echo "Updating apt repository"
apt-get -qq update
echo "Installing prerequisite packages"
apt-get -qq install git python-dev python-pip
apt-get -qq install libssl-dev libffi-dev python-dev
pip -q install markupsafe
pip -q install Jinja2==2.8.1
pip -q install git+git://github.com/ansible/ansible.git@v2.0.0-0.5.beta3

cd /vagrant/provisioning
ansible-playbook build_dev_vm.yml
