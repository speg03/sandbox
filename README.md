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
