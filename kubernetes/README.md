# Containerized - Kubernetes
> Configurations for running applications in development

## Setup

Install [Docker](https://docs.docker.com/docker-for-mac/).

Enable in Docker settings.

Install the kubernetes cli by running:

```sh
brew install kubernetes-cli
```

Make sure you have the correct context selected by running:

```sh
kubectl config use-context docker-desktop
```

Install Helm and initialize it:

```sh
brew install kubernetes-helm
helm init
```

## Ingresses

To be able to use ingresses, you will need to set up [trefik](https://traefik.io/). The current configuration comes from [here](https://medium.com/@thms.hmm/docker-for-mac-with-kubernetes-ingress-controller-with-traefik-e194919591bb).

Set up traefik in your local kubernetes cluster by navigating to the folder and running the `make` command:

```sh
cd support/traefik
make install
```

Add the following to `/etc/hosts`:

```
# Kubernetes on Docker
127.0.0.1	traefik.k8s
```

You should now be able to visit [http://traefik.k8s](http://traefik.k8s/) in your browser.

### Setting up an ingress for a service

```yaml
---
apiVersion: networking.k8s.io/v1beta1 # for versions before 1.14 use extensions/v1beta1
kind: Ingress
metadata:
  name: intress-name 
  annotations:
    ingress.kubernetes.io/rewrite-target: /
spec:
  backend:
    serviceName: default-http-backend
    servicePort: 80
  rules:
  - host: transactions.pietrobongiovanni.com.d
    http:
      paths:
      - path: /
        backend:
          serviceName: service-name
          servicePort: 80
```