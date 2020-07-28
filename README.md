# Docker image for Redis

Redis + stunnel Dockerfile for TLS on top of Redis.

## Features
- Stunnel for TLS
- Redis password support

## Starting Container 

### login registry

```console
$ docker login -u "$USER" -p "$PASSWORD" https://repo.decpack.cc/v2
```
The password should not use your **real** password.  
Go get a [Access Tokens](https://gitlab.devpack.cc/profile/personal_access_tokens) for instead.(Check **api** and **read_registry** for minimum setting.)

### without password

```console
$ docker run -d -p 6379:6379 -v /path/to/certs:/certs --name redis-tls repo.devpack.cc/mike_liu/redis-tls
```

### with password

```console
$ docker run -d -p 6379:6379 -v /path/to/certs:/certs --env REDIS_PASS="<<password here>>" --name redis-tls repo.devpack.cc/mike_liu/redis-tls
```

### For persistence, mount /data

```console
$ docker run --restart=always -d -p 6379:6379 -v /path/to/certs:/certs -v /hostpath/to/redisdatabackup:/data --env REDIS_PASS="<<password here>>" --name redis-tls repo.devpack.cc/mike_liu/redis-tls
```


The `/path/to/certs` should be a directory on the host that contains the appropriate `cert.pem` and `key.pem` files for `stunnel` to provide TLS encryption.
