FROM ubuntu:20.04

ENV TZ=Europe/Stockholm
ENV DEBIAN_FRONTEND=noninteractive
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq && apt-get install -qqy \
   sudo \
   tmux \
   vim 

# docker
# https://docs.docker.com/engine/install/ubuntu/#installation-methods
RUN apt-get update -qq && apt-get install -qqy \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update -qq && apt-get install -qqy \
   containerd.io \
   docker-ce \
   docker-ce-cli
