# sandbox

```sh
docker-compose up -d
docker cp sandbox_workspace_1:/home/arch/.ssh/sandbox_workspace ~/.ssh/
```

`~/.ssh/config`

```
Host workspace
  HostName 127.0.0.1
  Port 10022
  User arch
  IdentityFile ~/.ssh/sandbox_workspace
```
