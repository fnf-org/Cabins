# CABINS

California Foundation for the Advancement of Electronic Arts cabins reservations system

## Overview

This is a ruby on rails app that has been containerized into a single image/container running an apache2 httpd web server
and a puma application server. Some static content is served via httpd, the ruby app is all served via puma. httpd is
exposed on port 80, puma is on 3000 but is not exposed. The non-app image is separated out into the cabins-server image
and app specific stuff is built on top of that image.

**TODO**: rip out all the legacy crap below and document the new shit. it's changing... a lot. I hope in a good way.

## RUNNING locally

1. docker run --name mysql -e MYSQL_ROOT_PASSWORD=\<PASSWORD\> -d -p 3306:3306 mysql:5.6
1. login to gitlab docker registry: `docker login registry.gitlab.com` (use an access token if you have 2fa setup)
1. `docker build --build-arg RAILS_ENV=development -t cabins .`
2. `cp example.cabins.env cabins-dev.env` and update by replacing all the `XXXXXX`'s with your values.
3. `docker run --rm -it -p 80:80 --env-file ./cabins-dev.env -v /Users/cgerstle/src/personal/cabins:/var/www/cabins --name cabins cabins`
4. `hit localhost:80`
5. for console `bin/rails console` from inside the container


## email previews

http://localhost/rails/mailers/user_mailer/
http://localhost/rails/mailers/reservation_mailer/

## Deploy to Kubernetes

The `deployment/` directory contains the infrastructure to deploy Cabins on Kubernetes.

### One-Time Configuration

Follow these steps for the initial configuration. 

1. [Enable Kubernetes](https://docs.docker.com/desktop/kubernetes/) in Docker Desktop.
1. [Install Helm](https://helm.sh/docs/intro/install/) for your platform. 
1. Add the Bitnami repo to helm:

    ```console 
    $ helm repo add bitnami https://charts.bitnami.com/bitnami
    ```
1. Update the chart dependencies (pull in MariaDB)

    ```console 
    $ helm dependency update deployment/chart
    ```

### Testing Locally 

To test a local container build ensure the following settings are present in `deployment/values-minikube.yaml`:

```yaml
image:
  repository: cabins
  pullPolicy: Never
  tag: "latest"
```

Build the container locally:

```console 
$ docker build -t cabins . 
``` 

Install the helm chart:

```console 
$ helm install cabins deployment/chart --values deployment/values-minikube.yaml 
```

Verify it's installed: 

```console 
$ helm list 
$ kubectl get all 
``` 

Connect to the service. This command proxies local connections into the Kubernetes system:

```
$ kubectl port-forward service/cabins 3000:80
```

While it's running the application will be visible on `http://localhost:3000`. 

### Finding Log Output 

The Cabins container STDOUT is visible. You have to find the name of the pod, which will be randomized. For example:

```console
$ kubectl get all
NAME                          READY   STATUS    RESTARTS   AGE
pod/cabins-865df76dd5-mpxk9   1/1     Running   0          4m25s
pod/cabins-mariadb-0          1/1     Running   0          4m25s

NAME                     TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/cabins           LoadBalancer   10.106.163.116   <pending>     80:31536/TCP   4m25s
service/cabins-mariadb   ClusterIP      10.105.79.80     <none>        3306/TCP       4m25s
service/kubernetes       ClusterIP      10.96.0.1        <none>        443/TCP        11h

NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/cabins   1/1     1            1           4m25s

NAME                                DESIRED   CURRENT   READY   AGE
replicaset.apps/cabins-865df76dd5   1         1         1       4m25s

NAME                              READY   AGE
statefulset.apps/cabins-mariadb   1/1     4m25s
```

The pod name is `pod/cabins-865df76dd5-mpxk9`. Look at the logs with:

```console
$ kubectl logs -f pod/cabins-865df76dd5-mpxk9
```

### Cleanup 

To uninstall the Cabins chart: 

```console 
$ helm uninstall cabins
```

The database will still be intact. You can see the storage with:

```console 
$ kubectl get pvc
```

To delete the database and start over run:

```console
$ kubectl delete pvc/data-cabins-mariadb-0
```
