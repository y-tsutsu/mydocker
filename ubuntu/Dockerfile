FROM ubuntu:20.04

LABEL MAINTAINER tsustu <tsutsu0928@gmail.com>

ARG USERNAME=user
ARG USERPASS=default
ARG PROXY=http://proxy.example.com:8080

ENV USER ${USERNAME}
ENV HOME /home/${USER}
ENV SHELL /bin/bash
ENV TZ Asia/Tokyo
# ENV http_proxy ${PROXY}
# ENV https_proxy ${PROXY}
# ENV ftp_proxy ${PROXY}

EXPOSE 22 80

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y

RUN useradd -m ${USER}
RUN echo "${USER}:${USERPASS}" | chpasswd

RUN apt install -y sudo
RUN echo "${USER}  ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN echo "${USER}  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN visudo -c

# RUN echo export http_proxy=${PROXY} >> /root/.bashrc
# RUN echo export https_proxy=${PROXY} >> /root/.bashrc
# RUN echo export ftp_proxy=${PROXY} >> /root/.bashrc
# RUN echo Acquire::http::proxy '"'${PROXY}'";' >> /etc/apt/apt.conf
# RUN echo Acquire::https::proxy '"'${PROXY}'";' >> /etc/apt/apt.conf
# RUN echo Acquire::ftp::proxy '"'${PROXY}'";' >> /etc/apt/apt.conf

USER ${USER}
WORKDIR ${HOME}

RUN echo "export PATH=${PATH}:/usr/local/bin:${HOME}/.local/bin" >> ${HOME}/.bashrc

RUN sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
RUN sudo apt update && sudo apt upgrade -y
RUN sudo apt install -y language-pack-ja
RUN sudo update-locale LANG=ja_JP.UTF8
RUN sudo apt install -y tzdata
RUN echo "export LANG=ja_JP.UTF-8" >> ${HOME}/.bashrc

RUN sudo apt install -y build-essential vim nano python3 python3-pip ruby golang-go nodejs npm git cmake wget
RUN cd /tmp && \
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb
RUN sudo apt install -y software-properties-common
RUN sudo add-apt-repository universe
RUN sudo apt update
RUN sudo apt install -y apt-transport-https
RUN sudo apt update
RUN sudo apt install -y dotnet-sdk-3.1

RUN sudo apt install -y curl zip
RUN curl -s https://get.sdkman.io | bash
RUN source ${HOME}/.sdkman/bin/sdkman-init.sh && \
    sdk install kotlin && \
    sdk install java 11.0.9.hs-adpt

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN echo "source ${HOME}/.cargo/env" >> ${HOME}/.bashrc

RUN sudo apt install -y sl

RUN sudo apt install -y libncurses5-dev
RUN cd /tmp && \
    git clone https://github.com/abishekvashok/cmatrix.git && \
    cd cmatrix && \
    git checkout -b stable origin/stable && \
    mkdir build && cd build && \
    cmake .. && \
    make -j4 && \
    sudo make install

RUN source ${HOME}/.bashrc && \
    python3 -m pip install pip --upgrade && \
    python3 -m pip install snowmachine

RUN echo "alias python='python3'" >> ${HOME}/.bashrc
RUN echo "alias pip='pip3'" >> ${HOME}/.bashrc
RUN echo "export PS1=\"\n\[\033[35m\]\$(date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(tty | sed -e 's:/dev/::'):"\
    "\[\033[1;36m\]\$(ls -1 | wc -l | sed 's: ::g') files \[\033[1;33m\]\$(ls -lah | grep -m 1 合計 | sed 's/合計 //')b\[\033[0m\] -> \[\033[0m\]\"" \
    >> ${HOME}/.bashrc

RUN sudo sed -i "/${USER}  ALL=(ALL) NOPASSWD: ALL/d" /etc/sudoers
