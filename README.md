# Laravel K8s

![Build](https://github.com/chivincent-rosetta/laravel-k8s/workflows/Docker%20Image%20Builder/badge.svg)
![Laravel Testing](https://github.com/chivincent-rosetta/laravel-k8s/workflows/Laravel%20Testing/badge.svg)

This repository is running laravel application with kubernetes.

## Usage

### Prepare Credentials

#### GitHub Container Registry

```
$ echo -n "<Your GitHub Username>:<Your GitHub Token>" | base64
<AUTH TOKEN>
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: docker-configjson-ghcr-io
stringData:
  .dockerconfigjson: |
    {"auths":{"ghcr.io":{"auth":"<AUTH TOKEN>"}}}
```

```
$ kubectl apply -f docker-configjson-ghcr-io.yaml
```

#### Heroku Jaws MySQL Service

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: heroku-jaws-mysql
data:
  host: "" # Whatever
  username: "" # Whatever
  password: "" # Whatever
  database: "" # Whatever
```

```
$ kubectl apply -f mysql.yaml
```

#### Heroku Redis

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: heroku-redis
data:
  host: "" # Whatever
  port: "" # Whatever
  password: "" # Whatever
```

```
$ kubectl apply -f redis.yaml
```

#### Mailtrap

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mailtrap
data:
  port: "" # Whatever
  username: "" # Whatever
  password: "" # Whatever
```

```
$ kubectl apply -f mailtrap.yaml
```

### External Name Service

Because the MySQL and Redis is on Heroku (AWS RDS), we have to set up external name in K8s. 

```yaml
apiVersion: v1
kind: Service
metadata:
  name: heroku-mysql
spec:
  type: ExternalName
  externalName: "" # MySQL Host
```

```yaml
apiVersion: v1
kind: Service
metadata:
  name: heroku-redis
spec:
  type: ExternalName
  externalName: "" # Redis Host
```

```
$ kubectl apply -f mysql-externalname.yaml
$ kubectl apply -f redis-externalname.yaml
```

### Create Frontend Service

#### Apache PHP

```
$ kubectl apply -f .k8s/frontend/apache/frontend-deployment.yaml
$ kubectl apply -f .k8s/frontend/frontend-service.yaml
```

#### Nginx + PHP-FPM, Source Code copied

```
$ kubectl apply -f .k8s/frontend/nginx-copy/frontend-deployment.yaml
$ kubectl apply -f .k8s/frontend/frontend-service.yaml
```

#### Nginx + PHP-FPM, Source Code mounted

```
$ kubectl apply -f .k8s/frontend/nginx-mount/frontend-deployment.yaml
$ kubectl apply -f .k8s/frontend/frontend-service.yaml
```

#### Queue Worker, Laravel Horizon

```
$ kubectl apply -f .k8s/backend/queue-worker/backend-deployment.yaml
```
