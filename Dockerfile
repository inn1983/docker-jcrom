# Build environment for JCROM

FROM ubuntu:14.04
MAINTAINER Akihiro Maeda <jcrom-project@googlegroups.com>

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get -qq update

RUN apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev lib32z1 x11proto-core-dev libx11-dev lib32readline-gplv2-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils python-software-properties xsltproc wget sudo

RUN useradd --create-home jcrom

RUN mkdir /home/jcrom/bin
RUN curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /home/jcrom/bin/repo
RUN chmod a+x /home/jcrom/bin/repo

RUN cd /home/jcrom/ && wget -nc -q http://www.reucon.com/cdn/java/jdk-6u45-linux-x64.bin
RUN cd /home/jcrom/ && chmod a+x /home/jcrom/jdk-6u45-linux-x64.bin
RUN cd /home/jcrom/ && /home/jcrom/jdk-6u45-linux-x64.bin

RUN echo "export PATH=${PATH}:/home/jcrom/bin:/home/jcrom/jdk1.6.0_45/bin" >> /etc/bash.bashrc
RUN echo "export USE_CCACHE=1" >> /etc/bash.bashrc
RUN echo "export JAVA_HOME=/home/jcrom/jdk1.6.0_45" >> /etc/bash.bashrc
RUN echo "export ANDROID_JAVA_HOME=/home/jcrom/jdk1.6.0_45" >> /etc/bash.bashrc

RUN git config --global user.email "android"
RUN git config --global user.name "android"

RUN chmod a+x /etc/sudoers
RUN echo "jcrom ALL=(ALL) ALL" >> /etc/sudoers
RUN echo "jcrom ALL=(ALL) NOPASSWD: /bin/mount" >> /etc/sudoers
RUN echo "jcrom ALL=(ALL) NOPASSWD: /bin/umount" >> /etc/sudoers
RUN chmod 440 /etc/sudoers

RUN apt-get install -y u-boot-tools

WORKDIR /home/jcrom/android
VOLUME /home/jcrom/android

