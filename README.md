# CABINS

California Foundation for the Advancement of Electronic Arts cabins reservations system

## Overview

This is a ruby on rails app providing the cabins reservations system. 

## local dev

1. drop a `.env` file into place that looks something like

   ```
   # MARIA DB CONTAINER

   MARIADB_USER=cabins
   MARIADB_PASSWORD=password
   MARIADB_ROOT_PASSWORD=password

   # cabins

   CABINS_DATABASE_PASSWORD=password
   RAILS_ENV=development
   ```

2. `docker-compose up -d`
3. `docker-compose run web bundle exec rake db:reset`
4. You can then hit the app on `http://localhost:3000`
5. for logs, `docker-compose logs -f web`
6. Seeded admin login is `blah@invalid.com`. Password is `nopenope`

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
