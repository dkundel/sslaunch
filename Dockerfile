FROM ubuntu:16.04

# Check for updates
RUN apt-get update
RUN apt-get install --yes apt-transport-https
# For Dotnet
RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update

# Install Node.js
RUN apt-get install --yes curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

# Install Ruby
RUN apt-get install --yes ruby-full

# Install Python 2/3
# Already installed

# Install DotNet Core
RUN apt-get install --yes dotnet-dev-1.0.4

# Install Java
RUN apt-get install --yes default-jdk

# Install Swift
RUN apt-get install --yes clang libicu-dev wget
RUN wget -O swift.tar.gz https://swift.org/builds/swift-3.1.1-release/ubuntu1604/swift-3.1.1-RELEASE/swift-3.1.1-RELEASE-ubuntu16.04.tar.gz
RUN wget -O swift.tar.gz.sig https://swift.org/builds/swift-3.1.1-release/ubuntu1604/swift-3.1.1-RELEASE/swift-3.1.1-RELEASE-ubuntu16.04.tar.gz.sig
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
RUN gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
RUN gpg --verify swift.tar.gz.sig
RUN tar -zxvf swift.tar.gz
RUN ln -s /swift-3.1.1-RELEASE-ubuntu16.04/usr/bin/swift /bin/swift
# RUN echo "export PATH=\"/swift-3.1.1-RELEASE-ubuntu16.04/usr/bin:$PATH\"" >> /root/.profile
# RUN . /root/.profile

# Install PHP
RUN apt-get install --yes php

# Install editors
RUN apt-get install --yes vim nano emacs

RUN echo "echo \" ███████╗ ███████╗ ██╗       █████╗  ██╗   ██╗ ███╗   ██╗  ██████╗ ██╗  ██╗ \"" >> /root/.bashrc
RUN echo "echo \" ██╔════╝ ██╔════╝ ██║      ██╔══██╗ ██║   ██║ ████╗  ██║ ██╔════╝ ██║  ██║ \"" >> /root/.bashrc
RUN echo "echo \" ███████╗ ███████╗ ██║      ███████║ ██║   ██║ ██╔██╗ ██║ ██║      ███████║ \"" >> /root/.bashrc
RUN echo "echo \" ╚════██║ ╚════██║ ██║      ██╔══██║ ██║   ██║ ██║╚██╗██║ ██║      ██╔══██║ \"" >> /root/.bashrc
RUN echo "echo \" ███████║ ███████║ ███████╗ ██║  ██║ ╚██████╔╝ ██║ ╚████║ ╚██████╗ ██║  ██║ \"" >> /root/.bashrc
RUN echo "echo \" ╚══════╝ ╚══════╝ ╚══════╝ ╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═══╝  ╚═════╝ ╚═╝  ╚═╝ \"" >> /root/.bashrc
RUN echo "echo \"Welcome! You have .NET Core, Node.js, Ruby, Python, Python3, Java, Swift, PHP, C++ available.\"" >> /root/.bashrc
