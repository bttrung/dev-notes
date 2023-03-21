# A centralized useful technical notes for programmers

# Environment & Useful Software
- https://ohmyz.sh/#install
- https://sdkman.io/install
- https://www.spectacleapp.com/
- https://monosnap.com/

# brew
brew doctor

## Windows - MacOS vs Linux
- OSX - `open` is a universal opener in OSX
- Linux - has `xdg-open`
- Windows - `use start`

## Git
Config
```bash
git config --list
git config --global user.name "Your username"
git config --global user.email "Your email"
git config --local user.name "Your username"
git config --local user.email "Your email"
```

Origin
```bash
git remote show origin
git remote set-url origin <the-url-to-origin>

```

## Gradle
gradle init
gradle tasks
gradle tasks --all

Build Setup tasks
-----------------
- init - Initializes a new Gradle build.
- wrapper - Generates Gradle wrapper files.

Help tasks
----------
- buildEnvironment - Displays all buildscript dependencies declared in root project '1'.
- dependencies - Displays all dependencies declared in root project '1'.
- dependencyInsight - Displays the insight into a specific dependency in root project '1'.
- help - Displays a help message.
- javaToolchains - Displays the detected java toolchains.
- outgoingVariants - Displays the outgoing variants of root project '1'.
- projects - Displays the sub-projects of root project '1'.
- properties - Displays the properties of root project '1'.
- tasks - Displays the tasks runnable from root project '1'.

Other tasks
-----------
- components - Displays the components produced by root project '1'. [deprecated]
- dependentComponents - Displays the dependent components of components in root project '1'. [deprecated]
- model - Displays the configuration model of root project '1'. [deprecated]
- prepareKotlinBuildScriptModel



```
gradle --rerun-tasks build
```


Configuration Scopes
-----------
- `implementation` -> import only the dependent lib
- `testImplementation`
- `api` -> you want to import everything form dependency chain
- `compileOnly`
- `runtimeOnly`
- `testCompileOnly`
- `testRuntimeOnly`

Build Phases
-----------
- `Initialization`: project, module1, module2...
- `Configuration`: task1, task2...
- `Execution`: compile, test, jar...

## Ansible
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

**Inventory**
-----------

- Inventory parameters:
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

- Sample inventory file:
```shell
# Web Servers
web_node1 ansible_host=web01.xyz.com ansible_connection=winrm ansible_user=administrator ansible_password=Win$Pass
web_node2 ansible_host=web02.xyz.com ansible_connection=winrm ansible_user=administrator ansible_password=Win$Pass
web_node3 ansible_host=web03.xyz.com ansible_connection=winrm ansible_user=administrator ansible_password=Win$Pass

# DB Servers
sql_db1 ansible_host=sql01.xyz.com ansible_connection=ssh ansible_user=root ansible_ssh_pass=Lin$Pass
sql_db2 ansible_host=sql02.xyz.com ansible_connection=ssh ansible_user=root ansible_ssh_pass=Lin$Pass

# Groups
[db_nodes]
sql_db1
sql_db2

[web_nodes]
web_node1
web_node2
web_node3

[boston_nodes]
sql_db1
web_node1

[dallas_nodes]
sql_db2
web_node2
web_node3
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
