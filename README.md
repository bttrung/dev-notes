# A centralized useful technical notes for programmers

# Environment & Useful Software
- https://ohmyz.sh/#install
- https://sdkman.io/install
- https://www.spectacleapp.com/
- https://monosnap.com/

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
```
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
- - Play: defines a set of activities (tasks) to be run on hosts
- - Task: an action like: execute a command, run a script, install a package...


Exercises practice: 
- https://legacy.kodekloud.com/p/ansible-practice-test/?scenario=questions_ansible_inventory&fbclid=IwAR2YyrgbwpWITp9P3pajTCo9JK5sMHwkQtkXX9b5F9QdJymuYK-jWjE5XNU
- 

