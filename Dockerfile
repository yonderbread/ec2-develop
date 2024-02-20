# Base Image
FROM ubuntu:22.04

# Envioronment variables
RUN echo "PYTHONBUFFERED=1" >> /etc/envioronment
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "LANG=en_US.UTF-8" >> /etc/environment
RUN echo "NODE_ENV=development" >> /etc/environment

# Working Directory
WORKDIR /develop

# Install required development tools
#RUN add-apt-repository ppa:deadsnakes/ppa && apt update && apt install -y python3 python3-pip nodejs mysql-server
RUN apt update && apt install -y curl git build-essential ca-certificates python3 python3-pip nodejs mysql-server
RUN pip install --upgrade pip && pip install django

# Nodejs
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash
RUN apt install -y nodejs
RUN node -v
RUN npm -v
RUN npm i -g angular
# Clean up
RUN apt update && apt upgrade -y && apt autoremove -y

# Expose Ports
EXPOSE 8080
