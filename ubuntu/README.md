# Docker build

```
$ cd ubuntu
$ docker build -t <IMAGE_NAME> --build-arg USERNAME=<USERNAME> --build-arg USERPASS=<USERPASS> --build-arg PROXY=<PROXY> .
```

# Docker run

```
$ docker run -it --name <NAME> <IMAGE_NAME> /bin/bash
```

# Docker start & attach

```
$ docker start -ai <NAME>
```
