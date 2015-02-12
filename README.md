sandbox
=======

Installation
------------

```
$ mkdir -p ~/bin
$ curl https://speg03.github.io/sandbox/sandbox -o ~/bin/sandbox
$ chmod +x ~/bin/sandbox
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
