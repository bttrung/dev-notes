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
```

- Ansible is agentless: you don't need to install additional software on the target machine to be able work with Ansible

**Inventory**
-----------
- Default inventory location: 
/etc/ansible/hosts

- Inventory parameters:
```
ansible_connection = ssh/winrm/localhost
ansible_port = 22/5986/...
ansible_user = root/administrator/...
ansible_ssh_pass = Password/...
```


