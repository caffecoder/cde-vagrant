# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Specify Vagrant version and Vagrant API version
Vagrant.require_version '>= 1.8.5'
VAGRANTFILE_API_VERSION = '2'

# Create and configure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'ubuntu/xenial64'

  # path_prefix = 'https://raw.githubusercontent.com/caffecoder/cde-vagrant/master/dev_vagrant'
  path_prefix = 'dev_vagrant'

  config.vm.provision :shell, path: "#{path_prefix}/prepare_env.sh", privileged: true
  config.vm.provision :shell, path: "#{path_prefix}/install-postgresql.sh", privileged: true
  config.vm.provision :shell, path: "#{path_prefix}/install-rvm.sh", args: 'stable', privileged: false
  config.vm.provision :shell, path: "#{path_prefix}/install-ruby.sh", args: '2.3.0 bundler', privileged: false

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

  config.vm.network :private_network, ip: '192.168.5.2'

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.synced_folder '.', '/home/ubuntu/dev',
    type: 'nfs', nfs_version: 3, nfs_udp: true
    # type: 'nfs', nfs_version: 4, nfs_udp: false

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'cde-vagrant'

    vb.linked_clone = true
    vb.gui = false
    vb.memory = '1024'
    vb.cpus = 2
  end
end
