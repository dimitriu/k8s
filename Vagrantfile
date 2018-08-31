
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.provision "shell", path: "base.sh"

  config.vm.define :master, primary: true do |master|
    master.vm.provider "virtualbox" do |vb|
      vb.name = "master"
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = 2
    end
    master.vm.network "private_network", ip: "192.168.99.100"
    master.vm.provision :hosts, :sync_hosts => true
    master.vm.provision "shell", path: "master.sh"
  end

  config.vm.define :node1 do |node1|
    node1.vm.provider "virtualbox" do |vb|
      vb.name = "node1"
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = 2
    end
    node1.vm.network "private_network", ip: "192.168.99.101"
    node1.vm.provision :hosts, :sync_hosts => true
    node1.vm.provision "shell", path: "node.sh"
  end

  config.vm.define :node2 do |node2|
    node2.vm.provider "virtualbox" do |vb|
      vb.name = "node2"
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = 2
    end
    node2.vm.network "private_network", ip: "192.168.99.102"
    node2.vm.provision :hosts, :sync_hosts => true
    node2.vm.provision "shell", path: "node.sh"
  end

  config.vm.define :node3 do |node3|
    node3.vm.provider "virtualbox" do |vb|
      vb.name = "node3"
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = 2
    end
    node3.vm.network "private_network", ip: "192.168.99.103"
    node3.vm.provision :hosts, :sync_hosts => true
    node3.vm.provision "shell", path: "node.sh"
  end

end

