FROM ubuntu

LABEL MAINTAINER tsustu <tsutsu0928@gmail.com>

ENV USER user
ENV USERPASS default
ENV HOME /home/${USER}
ENV SHELL /bin/bash
# ENV http_proxy "http://proxy.example.com:8080"
# ENV https_proxy "https://proxy.example.com:8080"

EXPOSE 22 80

RUN apt update && apt upgrade -y

RUN useradd -m ${USER}
RUN echo "${USER}:${USERPASS}" | chpasswd

RUN apt install -y sudo
RUN echo "${USER}  ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN echo "${USER}  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN visudo -c

USER ${USER}
WORKDIR ${HOME}

RUN sudo apt install -y build-essential vim nano python3 python3-pip golang-go nodejs npm git cmake wget
RUN cd /tmp && \
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb
RUN sudo apt install -y software-properties-common
RUN sudo add-apt-repository universe
RUN sudo apt update
RUN sudo apt install -y apt-transport-https
RUN sudo apt update
RUN sudo apt install -y dotnet-sdk-3.1

RUN sudo apt install -y sl
RUN sudo ln -s /usr/games/sl /usr/local/bin/.

RUN sudo apt install -y libncurses5-dev
RUN cd /tmp && \
    git clone https://github.com/abishekvashok/cmatrix.git && \
    cd cmatrix && \
    mkdir build && cd build && \
    cmake .. && \
    make -j4 && \
    sudo make install

RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install snowmachine --user
RUN sudo ln -s ~/.local/bin/snowmachine /usr/local/bin/.
RUN echo "export LC_ALL=C.UTF-8" >> ~/.bashrc
RUN echo "export LANG=C.UTF-8" >> ~/.bashrc

RUN sudo sed -i "/${USER}  ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers
