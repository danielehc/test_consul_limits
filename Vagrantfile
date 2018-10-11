# Vagrantfile API/syntax version.
# NB: Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "danielec/stretch64"
  config.vm.provision "shell", path: "scripts/consul.sh", run: "always"
  config.vm.synced_folder ".", "/vagrant"
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--groups", "/consul_lab"]
  end

  #consul server
  (1..3).each do |i|
    config.vm.define vm_name = "consul#{i}" do |server|
        server.vm.hostname = vm_name
        server.vm.network "private_network", ip: "172.20.20.#{10+i}"

    end
  end

  # Redis Server
  config.vm.define "redis-server" do |rs|
      rs.vm.hostname = "redis"
      rs.vm.network "private_network", ip: "172.20.20.21"
      rs.vm.provision "shell", path: "scripts/redis.sh", run: "always"                   
  end

# Modern App
	(1..2).each do |i|
    config.vm.define vm_name = "webapp0#{i}" do |ma|
        ma.vm.hostname = vm_name
        ma.vm.network "private_network", ip: "172.20.20.#{30+i}"
				ma.vm.provision "shell", path: "scripts/golang.sh", run: "always" 
    end
  end

	# NGINX Server
  config.vm.define "web01" do |web|
      web.vm.hostname = "web01"
      web.vm.network "private_network", ip: "172.20.20.22"
      web.vm.provision "shell", path: "scripts/nginx.sh", run: "always" 
  end
  
end
