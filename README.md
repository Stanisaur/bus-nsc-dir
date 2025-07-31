# bus-nsc-dir
Example files and instructions for files to be mounted onto a [nats-box](https://github.com/nats-io/nats-box) container to initialise auth env for a [NATS](https://nats.io/) server.
## Requirements
- docker
- helm
## Setup (optional)
To create your own set of files, I recommend running a docker container to have a fresh env with a volume mounted, like so:
```
docker run --rm -it -v $PWD/final_nsc_state:/nsc natsio/nats-box:latest
```
Then, run the commands to create the structure you are looking for, see steps.sh as an example. Upload the entire contents of the folder to github.
Take note of the url when you click _code_, then copy the link on the _Download with ZIP_ button, it will be used later.
## Usage
### Kubernetes
Nats is meant to be deployed through its [helm chart](https://github.com/nats-io/k8s) which contains setup instructions. Specifically, we are concerned with the natsBox section in the Values.yaml file, which can be configured to load the files from the repo using the [busybox](https://hub.docker.com/_/busybox) image as follows:
```yaml
natsBox:
  enabled: true
  
```
