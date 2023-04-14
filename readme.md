# A centralized useful technical notes for programmers

# Environment & Useful Software
- https://ohmyz.sh/#install
- https://sdkman.io/install
- https://www.spectacleapp.com/
- https://monosnap.com/

# Homebrew
brew doctor

# Git

## basic
``` 
git init
git add .
git commit -m "message"
git status
git checkout
git merge <branch>
git fetch
git pull
git push
```

## config
```bash
git config --list
git config --global user.name "Your username"
git config --global user.email "Your email"
git config --local user.name "Your username"
git config --local user.email "Your email"
```

## branch
``` 
git branch => list all branches
git branch develop => create branch named develop
git merge develop => merge branch
git branch -d develop => delete branch
```
## states
``` 
- committed
- modified
- staged
```

## reset
``` 
git reset --soft HEAD~1 => remove last commit, move the changes from that commit to STAGED
git reset --hard HEAD~1 => remove completely the last commit changes
git reset -- . => remove the changes from STAGED
```

## remote
```bash
git remote show origin
git remote -v
git remote set-url origin <the-url-to-origin>
```

## log
``` 
git log --oneline --graph
```

## fetch vs pull
``` 
git fetch is the command that tells your local git to retrieve the latest meta-data info from the original (yet doesn't do any file transferring. It's more like just checking to see if there are any changes available). 
git pull on the other hand does that AND brings (copy) those changes from the remote repository
```

## tag vs branch
``` 
A tag represents a version of a particular branch at a moment in time. A branch represents a separate thread of development that may run concurrently with other development efforts on the same code base. Changes to a branch may eventually be merged back into another branch to unify them.

The difference between tags and branches are that a branch always points to the top of a development line and will change when a new commit is pushed whereas a tag will not change. Thus tags are more useful to "tag" a specific version and the tag will then always stay on that version and usually not be changed.
```

## merge vs rebase
TBD...

## Cherry pick


# Gradle
``` 
gradle init
gradle tasks
gradle tasks --all
```

## Configuration Scopes
- `implementation` -> import only the dependent lib
- `testImplementation`
- `api` -> you want to import everything form dependency chain
- `compileOnly`
- `runtimeOnly`
- `testCompileOnly`
- `testRuntimeOnly`

## Build Phases
- `Initialization`: project, module1, module2...
- `Configuration`: task1, task2...
- `Execution`: compile, test, jar...

# Ansible
```
brew install ansible
ansible --version

or:
sudo yum install ansible

or:
sudo yum install python3-pip
pip3 install ansible

or:
yum search epel
yum install <epel-release>
yum install ansible

```
- Ansible configs: /etc/ansible/ansible.cf
- Ansible is agentless: you don't need to install additional software on the target machine to be able work with Ansible

## Inventory
Inventory parameters:
```
ansible_host=172.0.0.1
ansible_connection = ssh/winrm/localhost
ansible_port = 22/5986/...
ansible_user = root/administrator/...
ansible_ssh_pass = Password/...
```
- Download os images from: https://www.osboxes.org/
- Clone into ansible-controller and ansible-server-1
- Modify hosts for all servers:
```
sudo vi /etc/hostname
ansibleconntroller

sudo vi /etc/hosts
127.0.0.1   localhost ansiblecontroller
::1         localhost ansibleconntroller

```


**Playbook**
- Playbook is a single yaml file:
    - Play: defines a set of activities (tasks) to be run on hosts
    - Task: an action like: execute a command, run a script, install a package...
- Module: (see more at ansible docs)
    - command
    - script
    - yum
    - service
    - ...

- How to execute ansible playbook?
```
ansible-playbook <playbook file name>

Ex:
ansible-playbook playbook.yml
```

Some command to run ansible and ansible playbook
```
ansible target1 -m ping -i inventory.txt 
ansible all -m ping -i inventory.txt 

ansible-playbook playbook-pingtest.yml -i inventory.txt

```

**Ansible modules**
- `command`: executes command on a remote node
- `script`: run a local script on a remote node after transferring it
- `service`: manage services: start/stop/restart...


**Ansible varialbe**
- Stores info that varies with each host

**Conditional**
- when: `<boolean>`
- when: `<boolean>` or `<boolean>`

**Loops**
- `loop`:
  - a
  - b
  - c
  - ...

- `with_*`:
  - with_items    
  - with_file
  - with_url
  - ...

**Ansible Roles**

**Ansible Galaxy**
```
ansible-galaxy collection install community.aws
```


Exercises practice: 
- https://legacy.kodekloud.com/p/ansible-practice-test/?scenario=questions_ansible_inventory&fbclid=IwAR2YyrgbwpWITp9P3pajTCo9JK5sMHwkQtkXX9b5F9QdJymuYK-jWjE5XNU



# Terraform

## Terraform HCL
```terraform
terraform console
var.myvar
"${var.myvar}"

var.mylist
var.mylist[0]
var.mylist[1]
slice(var.mylist, 0, 2)
        
var.mymap
var.mymap["key"]

```

- Terraform Providers
https://registry.terraform.io/browse/providers

## Terraform commands
```terraform
terraform init
terraform validate
terraform apply
terraform destroy
terraform plan

Keep the changes in an out file:
terraform plan -out create-first-aws-instance.terraform
        
Then only apply the changes to the infra
terraform apply create-first-aws-instance.terraform

Then remove the out file
rm create-first-aws-instance.terraform
```

## Provision Software: 2 ways:
- To build your own custom AMI using Packer
- To boot standardized AMIs, then install software:
  - Using file upload
  - Using remote exec
  - Using automation tools: Ansible, puppet, chef...

```terraform
Generate ssh key
ssh-keygen -f mykey

Enable security group (inbound rule to allow myIP address)
        
Then:
cd 2-software-provisioning

terraform init
terraform plan
terraform apply
```

## Outputting attributes (see 3-output-atributes)
- Terraform keeps attributes of all the resources 
- Refer to any attributes by specifying the following elements:
  - Resource Type: `aws_instance`
  - Resource name: `my-first-aws-instance`
  - Attribute name: `public_ip`

## Terraform State
- Terraform keeps the remote state of the infrastructure
- It stores in a file called `terraform.tfstate`
- There is also a backup of the previous state: `terraform.tfstate.backup`
- When executing `apply`, a new state and backup is written
- The terraform state can be saved remote using the backend function
- The default is local terraform state file
- Remote backend:
  - consult
  - s3 bucket
  - ...


# AWS
Find where stores the aws credentials configs
```
aws configure
cat ~/.aws/credentials
cat ~/.aws/config
```

Check aws installation
```
which aws
aws --version
```

Check config
```aws
aws configure list
aws configure list-profiles
```

Execute with profile
```
aws s3 ls --profile profilename
```

Set aws env variable
```
export AWS_ACCESS_KEY_ID=<id>
export AWS_SECRET_ACCESS_KEY=<key>
export AWS_DEFAULT_REGION=us-west-2
```
# Redis

# Docker
### Manage images
Pull an image
``` 
docker pull <image>:<tag>
docker pull nginx
```

Push and image
``` 
docker push <image>
```

Show list images
```
docker images
docker image ls
```

Delete an image / dangling images / all unused images
``` 
docker rmi <image-name>
docker image prune
docker image prune -a
```

Build an image from Dockerfile
``` 
docker build <directory>
docker build . 
```

Tag an image
```
docker tag <image> <new image>
docker tag jenkins jenkins:v2
```

Build and tag and image from Dockerfile
``` 
docker build -t <image> <directory>

```

### Container

Show a list of running/all containers
``` 
docker ps
docker ps -a (list all, include inactive)
```

Delete a container
``` 
docker rm <container>
docker rm web
```

Delete stopped containers
``` 
docker container prune
```

Start/stop container
``` 
docker start <container>
docker stop <container>
```

Run new container
``` 
docker run <image>

...assign container name
docker run --name <container name> <image>

...and map port
docker run -p HOSTPORT:CONTAINER_PORT <image>

... and run in background
docker run -d <image>

... and assign host name
docker run --hostname HOSTNAME <image>

... and add dns entry
docker run --add-host HOSTNAME:IP  <image>

... and map volume
docker run -v HOSTDIR:TARGET_DIR <image>

... change the entrypoint
docker run -entrypoint EXCUTABLE <image>
docker run -entrypoint bash nginx
```

Container Management
``` 
docker create <image>
docker kill <container>
docker restart <container>
docker pause <container>
docker unpause <container>
docker rm -f <container>
```

Inspect Container
``` 
docker logs -f <conainer>   // show container output
docker top <container>      // list the processes running inside container
docker diff <container>     // show the diff between container and the image
docker inspect <container>  // show lo-level infp
docker image history <image> 
```

Interact with a container
``` 
docker attach <container>             // attach to a running container
docker cp container:path hostpath|-   // copy file from container 
docker cp hostpath|- container:path   // copy file to container 
docker export <container>             // export content of a container
docker exec <container> <args>        // run a command in a container
```


Search an image in the docker registry
``` 
docker search <text>
```

Docker save and load
``` 
docker save -o  <fileName.tar> <image name>
docker save <repo>:<tag>    // export as a tarbal file
docker load                 // load images from a  tarbal
```

Docker login logout
``` 
docker login ...
docker logout ...
```

Show current connected docker registry
``` 
cat ~/.docker/config.json 
```

Show all docker system info
``` 
docker system info
docker info
```

Docker volume
```
docker volume ls
docker volume create V1
docker volume rm V1
docker volume inspect V1
```

Docker networking
``` 
docker network ls
docker network inspect bridge
docker network create --driver bridge mynetwork

assign container to network
docker run -it --name B3 --network mynetwork ubuntu
docker run -it --name B4 --network mynetwork ubuntu

verify that both 2 container above is show in the mynetwork
docker network inspect mynetwork

expose network outside
docker run -it --name B5 --network -p 9999:80 mynetwork ubuntu
```

### Dockerfile

## Docker compose

## Kubernetes

### Basic
```
kubectl version --short
kubectl cluster-info
kubectl api-resources --> list all k8s resources
kubectl get endpoints
kubectl get ns
kubectl get services

```

### Configs
``` 
kubectl config get-contexts
kubectl get componentstatus
kubectl config use-context default
```

### Nodes
```
kubectl describe nodes
kubectl describe node/docker-desktop
kubectl get node
kubectl get node docker-desktop -o wide -> more info about node
kubectl get node docker-desktop -o yaml -> get yaml config about node
```

### Pod



# Helm
helm init --client-only
helm init --upgrade
helm repo list
helm repo update
helm search
helm ls
helm ls --deleted
helm ls --all
helm status <aaa>
helm history <aaa>