FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
MAINTAINER shaswot <shaswot@acsl.ics.keio.ac.jp>

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /repos/

# Build with some basic utilities
RUN apt-get -yqq update --fix-missing
RUN apt-get -yqq install \
        python3-pip \
        apt-utils \
        vim \
        git \
        screen \
        htop \
        wget \
        net-tools \
        xvfb \
        ffmpeg \
        freeglut3-dev \
        swig \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

# set a directory for the repos (working directory)
RUN mkdir -p /repos/

# folder to share files with host machine
# /stash folder stores large dumpfiles that can be accessed from the host computer
RUN mkdir -p /stash
VOLUME /stash


# build with some basic python packages
RUN pip install --upgrade pip
RUN pip install \
        numpy \
        jupyterlab \
        pandas \
        scipy \
        matplotlib \
        seaborn \
        ipywidgets \
        scikit-learn \
        scikit-image \
        autopep8 \
        ipynbname \
        gitpython \
	tqdm \
	autopep8 
	
RUN pip install \
	torch==2.0.1+cu118 \
	torchaudio==2.0.2+cu118 \
	torchvision==0.15.2+cu118 --index-url https://download.pytorch.org/whl/cu118 

RUN pip install \
        nvidia-cudnn-cu11==8.6.0.163 \
	tensorflow==2.12.0 

RUN pip install gymnasium[all]

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
EXPOSE 6006

# start jupyter lab
# define the port number(s) the container should expose
# All running containers expose 8888 and 6006
# They are redirected to other ports using docker -p <machine_port>:8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]

# Change workdir to root so that Jupyter Lab can access the /stash folder
# /stash folder stores large dumpfiles that can be accessed from the host computer
# WORKDIR /

