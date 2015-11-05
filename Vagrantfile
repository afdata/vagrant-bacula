# vagrant-librarian-puppet
# librarian-puppet

Vagrant.configure("2") do |config|

  # config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-i386-virtualbox-puppet.box"
  # box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
  # box = "centos-6.5-x86_64"
  
  box = "centos65-64"
  box_url = "http://www.afdata.de/centos65-64.box"

  config.vm.define "bacula-test" do |server|
    server.cache.auto_detect = true
    server.vm.box = box
    server.vm.box_url = box_url
    server.vm.hostname = "bacula.test.local"
    server.vm.network :private_network, ip: "192.168.33.21"
    server.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"]
      v.customize ["modifyvm", :id, "--cpus", "2"] 
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    config.librarian_puppet.puppetfile_dir = "./"
    config.vm.provision :puppet do |puppet|
       puppet.manifests_path = "manifests"
       puppet.manifest_file  = "init.pp"
       puppet.module_path = "modules"
       puppet.facter = {
           "db_root_password" => "root",
           "dnsforwareder1" => "8.8.8.8"
       }
    end
  end
end
