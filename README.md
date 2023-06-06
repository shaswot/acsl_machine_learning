# acsl_machine_learning
Docker repo for ML research environment


## Build your docker image using
```
docker build -f ./docker/Dockerfile -t <some_image_name:some_tag> .
```

## Make changes to the `start_docker_container.sh` script file.
> Reference:
```
docker run \
 	--rm \                       			# remove the container when it exits
	--dit \                       			# (detached, interactive, tty)
	--name <whimsical_container_name> \
	-p <host_machine_jupyter_lab_port>:8888 \ 	# port forwarding: <Host>:<Container>
	-p <host_machine_tensorboard_port>:6006 \	# port forwarding: <Host>:<Container>
	--gpus all \                 			# support all gpus (docker > 19.03). remove for machines without gpus
	-v /local_vol:/docker_vol \  			# volume: mapping local folder to container
	-e JUPYTER_TOKEN=<passwd> \    			# Jupyter password: passwd
   	<some_image_name:tag> 				# image name
```
## Run your container using the script file
```
chmod +x start_docker_container.sh
./start_docker_container.sh
```

### Image is built on `cuda:11.8.0-cudnn8-devel-ubuntu22.04`

### Available ML frameworks (with GPU support) are:
```
tensorflow==2.12.0
torch==2.0.1+cu118
torchaudio==2.0.2+cu118
torchvision==0.15.2+cu118
```

> Jupyter Lab is available

> `gymanisum[all]` is listed inrequirements.txt

> Does not use conda environment or venv



