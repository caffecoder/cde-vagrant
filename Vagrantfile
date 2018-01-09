# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Specify Vagrant version and Vagrant API version
Vagrant.require_version '>= 1.9.7'
VAGRANTFILE_API_VERSION = '2'.freeze

# Create and configure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # path_prefix = 'https://raw.githubusercontent.com/xcdr/cde-vagrant/master/dev_vagrant'
  path_prefix = 'dev_vagrant'

  config.vm.provision :shell, path: "#{path_prefix}/prepare_env.sh", privileged: true
  # config.vm.provision :shell, path: "#{path_prefix}/install-postgresql.sh", privileged: true
  # config.vm.provision :shell, path: "#{path_prefix}/install-rvm.sh", args: 'stable', privileged: false
  # config.vm.provision :shell, path: "#{path_prefix}/install-ruby.sh", args: '2.4.3 bundler', privileged: false

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.

  config.vm.network :private_network, ip: '10.255.255.2'

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.synced_folder '.', '/home/vagrant/dev', type: 'nfs', nfs_version: 3, nfs_udp: false

  # if Vagrant::Util::Platform.linux?
  #   config.vm.synced_folder '.', '/home/vagrant/dev', type: 'nfs', nfs_version: 4, nfs_udp: false
  # else
  #   config.vm.synced_folder '.', '/home/vagrant/dev', type: 'nfs', nfs_version: 3, nfs_udp: true
  # end

  config.vm.box = 'debian/stretch64' # available for virtualbox, libvirt, lxc

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.

  config.vm.provider :libvirt do |box|
    box.driver = 'kvm'
    box.cpus = 2
    box.memory = '1024'
  end

  config.vm.provider :virtualbox do |box|
    box.cpus = 2
    box.memory = '1024'

    box.linked_clone = true
    box.gui = false

    box.name = 'cde-vagrant'
  end

  # See: https://github.com/mhallin/vagrant-notify-forwarder
  if Vagrant.has_plugin?('vagrant-notify-forwarder')
    config.notify_forwarder.port = 22020
  else
    puts 'vagrant-notify-forwarder is not installed!'
  end

  # See: https://github.com/devopsgroup-io/vagrant-hostmanager
  if Vagrant.has_plugin?('vagrant-hostmanager')
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  else
    puts 'vagrant-hostmanager is not installed!'
  end
end
