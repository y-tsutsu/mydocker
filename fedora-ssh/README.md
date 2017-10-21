# Docker build

```
$ cd fedora-ssh
$ sudo docker build -t IMAGE_NAME .
```

# Docker run

-dオプションでバックグラウンド起動する．

```
$ sudo docker run -d --name NAME IMAGE_NAME
```

外部からアクセスする場合はport forwardを設定する．

```
$ sudo docker run -p 2200:22 -p 8080:80 -d --name NAME IMAGE_NAME
```

# Connect

## docker exec

```
$ sudo docker exec -it NAME /bin/bash
```

## ssh

```
$ ssh root@172.17.0.2
```
