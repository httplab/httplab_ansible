# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.ssh.insert_key = true
  config.ssh.forward_agent = true

  config.vm.provision 'ansible' do |ansible|
    ansible.playbook = 'server.yml'
    ansible.verbose = 'vvvv'
    # ansible.force_remote_user = true
  end

  config.vm.define 'my' do |dev|
    dev.vm.hostname = 'httplab-ansible'
    dev.vm.network :private_network, ip: '192.168.131.100'
  end

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end
end
