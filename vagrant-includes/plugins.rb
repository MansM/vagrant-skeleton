Vagrant.configure(2) do |config|
  if Vagrant.has_plugin?("vagrant-triggers")
    # every time a machine is destroyed, delete the certs and remove the resources from puppetdb
    config.trigger.after [:destroy] do
        target = @machine.config.vm.hostname.to_s
        puppetmaster = "puppetmaster"
        if target != puppetmaster
          system("vagrant ssh #{puppetmaster} -c 'sudo /usr/bin/puppet cert clean #{target}'" )
        end
    end
  else
    abort("Please install the triggers plugin, vagrant plugin install vagrant-triggers")
  end
end