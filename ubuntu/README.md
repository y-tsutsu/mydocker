# Docker build

```
$ cd ubuntu
$ docker build -t <IMAGE_NAME> --build-arg USERNAME=<USERNAME> --build-arg USERPASS=<USERPASS> --build-arg PROXY=<PROXY> .
```

# Docker run

-dオプションでバックグラウンド起動する．

```
$ docker run -it --name <NAME> <IMAGE_NAME> /bin/bash
```

外部からアクセスする場合はport forwardを設定する．

```
$ docker run -p 2200:22 -p 8080:80 -it --name <NAME> <IMAGE_NAME> /bin/bash
```

# Connect

## docker start & attach

```
$ docker start <NAME>
$ docker attach <NAME>
```
