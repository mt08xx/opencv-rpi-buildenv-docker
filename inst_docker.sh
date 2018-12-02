#!/bin/sh

# Everything else needs to be run as root
if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root. \n"
  exit 1
fi

#
# Install Docker
#echo `cat /proc/uptime | cut -f 1 -d ' '`  Installing: docker

apt-get update && 
apt-get install -y curl jq bash-completion \
                   qemu-user-static binfmt-support

if [ ! -f /usr/bin/docker ]; then sh -c 'curl -sSL https://get.docker.com/ | sh'; fi

# docker-compose - https://docs.docker.com/compose/install/
if [ ! $(which docker-machine) ] ; then
        echo `cat /proc/uptime | cut -f 1 -d ' '`  Installing: docker-compose
        #curl -sL $(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".assets[] | select(.name | test(\\\"`uname -s`-`uname -m`$\\\")) | .browser_download_url") -o /usr/local/bin/docker-compose
        DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
        curl -sL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
        curl -sL https://raw.githubusercontent.com/docker/compose/${DOCKER_COMPOSE_VERSION}/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
        docker-compose --version
fi

# docker-machine - https://docs.docker.com/machine/install-machine/
if [ ! $(which docker-machine) ] ; then
        DOCKER_MACHINE_VERSION=$(curl -s https://api.github.com/repos/docker/machine/releases/latest | jq -r ".tag_name")
        base=https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION} && \
        curl -sL $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && \
        install /tmp/docker-machine /usr/local/bin/docker-machine
        rm -f /tmp/docker-machine
        base=https://raw.githubusercontent.com/docker/machine/${DOCKER_MACHINE_VERSION}
        for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
        do
                wget "$base/contrib/completion/bash/${i}" -O /etc/bash_completion.d/${i}
        done
        docker-machine --version
fi
