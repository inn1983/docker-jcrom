# Build environment for B2JC

FROM ubuntu:12.04
MAINTAINER Akihiro Maeda <jcrom-project@googlegroups.com>

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get -qq update

RUN apt-get install -y fakeroot
RUN fakeroot apt-get install -y autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev make mercurial zip dbus libdbus-glib-1-dev libxml2-utils python-dev wget libasound2
RUN fakeroot apt-get install -y openjdk-6-jdk

RUN useradd --create-home jcrom

RUN mkdir /home/jcrom/bin
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /home/jcrom/bin/repo
RUN chmod a+x /home/jcrom/bin/repo

RUN echo "export PATH=${PATH}:/home/jcrom/bin" >> /etc/bash.bashrc
RUN echo "export USE_CCACHE=1" >> /etc/bash.bashrc
RUN echo "export SHELL=/bin/bash" >> /etc/bash.bashrc

RUN git config --global user.email "firefoxos"
RUN git config --global user.name "firefoxos"

WORKDIR /home/jcrom/firefoxos
VOLUME /home/jcrom/firefoxos

