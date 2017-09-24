##Vagantfile 

```bash
$ Vagrant.configure("2") do |config|
  config.vm.box = "lekshmin/centos7-docker"
  config.vm.box_version = "1.1.1"
  config.vm.network "public_network"
  config.vm.define "docker" do |docker|
  end
end
 
```


##Named definition here docker is just a name 

```bash
$config.vm.define "docker" do |docker|
 end

```

##Network selection 
```bash
$config.vm.network "public_network"
```



