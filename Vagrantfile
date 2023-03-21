Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

	
	config.vm.define :nodo1 do |nodo1|
    	nodo1.vm.box = "rhel7.9"
	    nodo1.vm.hostname = "Server1"
	    nodo1.vm.network :private_network,:ip => "192.168.121.82"
		nodo1.vm.provider :libvirt do |libvirt|
		   	libvirt.memory = 1040
	    	libvirt.cpus = 2
	      	#define personalizadamente como estara distribuida la CPU
	      	libvirt.cputopology :sockets => '1', :cores => '2', :threads => '1'
	      	libvirt.storage :file, :device => :cdrom, :path => '/laboratorio/Sistemas-Operativos/rhel-server-7.9-x86_64-dvd.iso'
	    end
		nodo1.vm.provision "shell", run: "/vagrant/preparar.sh", inline: "sh /vagrant/preparar.sh" ### preparar	
  	end   

	config.vm.define :nodo2 do |nodo2|
    	nodo2.vm.box = "rhel7.9"
	    nodo2.vm.hostname = "server2"
	    nodo2.vm.network :private_network,:ip => "192.168.121.83"
		nodo2.vm.provider :libvirt do |libvirt|
		   	libvirt.memory = 1040
	    	libvirt.cpus = 2
	      	#define personalizadamente como estara distribuida la CPU
	      	libvirt.cputopology :sockets => '1', :cores => '2', :threads => '1'
	      	libvirt.storage :file, :device => :cdrom, :path => '/laboratorio/Sistemas-Operativos/rhel-server-7.9-x86_64-dvd.iso'
	    end
		nodo2.vm.provision "shell", run: "/vagrant/preparar.sh", inline: "sh /vagrant/preparar.sh" ### preparar	
  	end   

end
	
