FROM tensorflow/tensorflow:latest-gpu
# Takes care of hdf5 error
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-pip \
	vim \
	ssh \
        wget \
	tzdata \
	gcc gfortran libopenmpi-dev openmpi-bin openmpi-common openmpi-doc binutils \
        && rm -rf /var/lib/apt/lists/*

# Set the timezone.
RUN echo "America/New_York" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV TZ=America/New_York
