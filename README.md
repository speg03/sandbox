sandbox
=======

Requirements
------------

* Docker

Installation
------------

```
$ curl -O https://raw.githubusercontent.com/speg03/sandbox/master/bin/sandbox
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

Change home directory in sandbox container (default `$HOME`)

```
$ SANDBOX_HOME=$HOME/sandbox sandbox start
```

Tips
----

SSH configuration example (default `$HOME/.ssh/config`)

```
Host sandbox
  HostName 127.0.0.1
  Port 3222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile ~/.ssh/sandbox.pem
  IdentitiesOnly yes
```
