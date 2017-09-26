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


#Vagrant Virtual box creation

Download this virtualbox on $HOME folder

```bash
$ Vagrant.configure("2") do |config|
  config.vm.box = "lekshmin/centos7-docker"
  config.vm.box_version = "1.1.1"
  config.vm.network "public_network"
  config.vm.define "docker" do |docker|
  end
end
 
```


#Vagrant up

```bash
Vagrant up adp 
```


#select the network connection method 

```bash
==> terra: Available bridged network interfaces:
1) wlan0
2) docker0
3) eth0
==> terra: When choosing an interface, it is usually the one that is
==> terra: being used to connect to the internet.
    terra: Which interface should the network bridge to? 1
```


#Establish SSH connection 
```bash
$ ssh vagrant adp 
`

#Get sudo access on terminal 
```bash
$ sudo bash
```


run script - Run the Nginx image, mounting the certificates directory from your host.


Run the repo-sync.sh in-order to fetch the GIT repositary on location machine. 

```bash
$bash repo-sync.sh




```bash
$cd nginx-docker-master


Building our own docker image from a Dockerfile inorder to install nginx server

#Dockerfile
```bash
#Set the base image to centos
FROM centos:7

#File Author / Maintainer
MAINTAINER Lekshminarayanan Kolappan

#Update the repository and install nginx server
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx

#Working files Definition 
ADD /files/index.html /usr/share/nginx/html/index.html
ADD /files/1.html /usr/share/nginx/html/1.html
ADD /files/2.html /usr/share/nginx/html/2.html
ADD /files/3.html /usr/share/nginx/html/3.html

#Expose Redis port 80 
EXPOSE 80/tcp

#Run app using
CMD ["nginx", "-g daemon off;"]
```

#Dockerbuild 

```bash
$docker build -t centos7/nginx .
````

#Running nginx webserver on docker container by exposing port 80

```bash
$docker run --name nginx-adp-v1.0 -dit -p 80:80 centos7/nginx

#confirm the process

```bash
$docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
f2b6e1eea261        centos7/nginx       "nginx '-g daemon off"   3 seconds ago       Up 2 seconds        0.0.0.0:80->80/tcp   nginx-adp-v1.1
```

```bash
Access the web server from the browser by navigating to
$localhost:80 
```


#Installing nginx server by Docker-compose 
```bash
docker stop container-id
```

```bash
cd nginx-docker-compose

#Docker-composer File
$cat docker-compose.yml

version: "2"
services:
  nginx:
    image: nginx:1.10.0
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/log:/var/log/nginx
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - ./nginx/1.html:/usr/share/nginx/html/1.html
      - ./nginx/2.html:/usr/share/nginx/html/2.html
      - ./nginx/3.html:/usr/share/nginx/html/3.html
      - ./nginx/index.html:/usr/share/nginx/html/index.html

```


#Docker-compose
```bash
$docker-compose up -d
Starting nginxdockercomposemaster_nginx_1 ... 
Starting nginxdockercomposemaster_nginx_1 ... done
$docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                      NAMES
6c3dd35f3133        nginx:1.10.0        "nginx -g 'daemon off"   About an hour ago   Up 10 seconds       0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   nginxdockercomposemaster_nginx_1
```

```bash
Access the web server from the browser by navigating to
$localhost:80 
```



