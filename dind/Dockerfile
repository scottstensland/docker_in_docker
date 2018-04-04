
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN apt-get update

RUN apt-get install -y xtail jq psmisc openssh-client git curl build-essential sudo vim wget dnsutils  libcurl3-gnutls libisl-dev  libidn11:amd64    libidn11-dev  libfontconfig net-tools 

ENV YES=yes
ENV NO=no

ADD .vimrc /root/.vimrc
ADD .vimrc /tmp/.vimrc
ADD vimrc /etc/vim/vimrc


# ... now jack up

RUN groupadd -g 999 docker
ENV GKE_SYSID_USER=scott

RUN groupadd -g   1000 -r scott 
RUN mkdir -p $(dirname /inner_home/scott )
RUN useradd -r -u 1000 -g 1000 scott -m --create-home --home-dir /inner_home/scott --shell /bin/bash -c "non root user"
RUN usermod -a -G docker scott


COPY  give_powers.sh give_powers.sh
RUN ./give_powers.sh scott 

COPY .bashrc /tmp/.bashrc
USER $GKE_SYSID_USER
WORKDIR /inner_home/scott


CMD ["/bin/bash"]
