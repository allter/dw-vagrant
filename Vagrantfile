# -*- mode: ruby -*-
# vi: set ft=ruby :

HOST_NAME = "dreamwidth-dev"
Vagrant.configure(2) do |config|

  config.vm.provider :virtualbox do |vb, override|
	  # Every Vagrant development environment requires a box. You can search for
	  # boxes at https://atlas.hashicorp.com/search.
    override.vm.box = "ubuntu/xenial32"
	#  config.vm.box = "ubuntu/trusty32"
	#  config.vm.box = "ubuntu/trusty64"
		vb.cpus = 1
		#vb.customize ["modifyvm", :id, "--hwvirtex", "off"]
			#vb.customize ["modifyvm", :id, "--ioapic", "off"]
	end
  config.vm.provider "docker" do |d|
    #d.image = "phusion/baseimage"
    #d.image = "ubuntu"
    d.build_dir = "."
    d.has_ssh = true
  end

#config.vm.boot_timeout = 1200


  config.vm.hostname = HOST_NAME

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.define HOST_NAME do |host|
  end

  config.vm.provision :shell,
    :keep_color => true,
    :inline => "export PYTHONUNBUFFERED=1 && export ANSIBLE_FORCE_COLOR=1 && cd /vagrant/provisioning && ./init.sh"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.111.111.111"
end
