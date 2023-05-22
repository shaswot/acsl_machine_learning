# START DOCKER CONTAINER
# remove --gpus all for machines without gpu support in docker
docker run --gpus all \
	--name <container_name> \
	-dit \
	-p <hhhh>:8888 \
	-p <hhhh>:6006 \
	-v ~/stash:/stash \
	-e JUPYTER_TOKEN=<hxxh> \
	<image_name>
