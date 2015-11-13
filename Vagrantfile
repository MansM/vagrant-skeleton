Vagrant.configure(2) do |config|

  begin
    load 'vagrant-includes/plugins.rb'
  rescue LoadError
      # ignore
  end 
#fix for some stdin: is not a tty annoyance

  config.vm.define "puppetmaster" do |puppetmaster|
    puppetmaster.vm.box = "/Users/Mans/Documents/packer/debian-7.8.0-amd64_virtualbox.box"
    puppetmaster.vm.hostname = "puppet"
    puppetmaster.vm.provider "virtualbox" do |vb|
      vb.name = "puppetmaster"
      vb.customize ["modifyvm", :id, "--groups", "/puppet"]
    end
    puppetmaster.vm.network "private_network", ip: "192.168.50.4", virtualbox__intnet: true
    puppetmaster.vm.network "forwarded_port", guest: 80, host: 8080
    puppetmaster.vm.provision "shell", path: "vagrant-scripts/debian-puppetinstall.sh"
    puppetmaster.vm.provision "shell", path: "vagrant-scripts/debian-puppetmasterinstall.sh"

    puppetmaster.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet-local/modules"
      puppet.manifest_file = "puppetmaster.pp"
    end

    # puppetmaster.vm.provision "puppet_server" do |puppet|
    #   puppet.options = "--verbose --pluginsync"
    # end
  end
end