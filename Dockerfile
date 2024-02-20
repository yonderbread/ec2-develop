# [ Base Image ]
FROM ubuntu:22.04

# [ Envioronment variables setup ]
ENV PYTHONBUFFERED 1

# Working Directory
WORKDIR /develop

# Install required development tools
RUN add-apt-repository ppa:deadsnakes/ppa && apt update && apt install -y python3 python3-pip nodejs mysql-server
RUN pip install --upgrade pip && pip install django
RUN npm i -g angular

# Expose Ports
EXPOSE 8080
