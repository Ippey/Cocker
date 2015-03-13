# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"


  config.vm.provider "virtualbox" do |v|
  	v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  	v.name = "Cocker"
  end

  # Setup Docker
  config.vm.provision "docker" do |docker|
  	docker.build_image "/vagrant", args: "-t cocker/image"
  	docker.run "cocker/image", args: "-d -t -v /vagrant:/tmp/shared"
  end


end
