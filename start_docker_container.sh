# START DOCKER CONTAINER
docker run \
	--dit \		 	# (detached, interactive, tty)
	--name acsl_ml \ 	#image name
	-p 1111:8888 \ 	 	# port forwarding: <Host>:<Container>
	-p 1106:6006 \	 	# port forwarding: <Host>:<Container>
	--gpus all \     	# support all gpus (docker > 19.03)
	-v ~/stash:/stash 	# volume: mapping local folder to container
	-e JUPYTER_TOKEN=acsl_passwd \ 	# Jupyter password: passwd
   	<acsl/rl_gym:0.1> 		# image name


