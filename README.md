sandbox
=======

Requirements
------------

* Docker

Installation
------------

```
$ curl -O https://speg03.github.io/sandbox/sandbox
$ chmod +x ./sandbox
```

Usage
-----

```
$ sandbox
Usage: sandbox [command] [options] [command-in-container]

Commands:
    start  Start sandbox docker container
    run    Run a command in sandbox

Options:
    -p     Publish a port (see "docker help run")
    -h     Print this help
```

Customize
---------

Change home directory of sandbox container (default `$HOME`)

```
$ SANDBOX_HOME=$HOME/sandbox sandbox start
```

Tips
----

SSH configuration example (default `$HOME/.ssh/config`)

```
Host sandbox
  HostName 127.0.0.1
  User vagrant
  Port 3222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/sandbox/.ssh/id_rsa_sandbox
  IdentitiesOnly yes
  LogLevel FATAL
```
