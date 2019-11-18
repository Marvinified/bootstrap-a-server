#!/usr/bin/env bash
# Install git
yes "y" | apt update
yes "y" | apt install git
git version
# Setup git ssh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
echo "Add the public key to your git cloud (Bitbucket or github) account"
echo "                                                                   "
cat ~/.ssh/id_rsa.pub
echo "                                                                   "
echo "run ssh  T git@bitbucket.org to verify after adding."
# Setup Docker
# Remove old docker
yes "y" | apt-get remove docker docker-engine docker.io
yes "y" | apt-get update
# instal dependencies
yes "y" | apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
yes "y" | apt-get update
yes "y" | apt-get install docker-ce

# Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker-compose --version
# curl -fsSL https://get.docker.com -o get-docker.sh
# sh get-docker.sh

# Nginx
apt-get install nginx
service nginx start
service nginx status

# Certbot
yes "y" | add-apt-repository ppa:certbot/certbot
yes "y" | apt install python-certbot-nginx

certbot -d $1

cp nginx.conf /etc/nginx/sites-enabled
rm  /etc/nginx/sites-enabled/default
service nginx restart
service nginx status

echo "-------------------------------------------------------------------"
echo "-------------------------------------------------------------------"
echo "Add the public key to your git cloud (Bitbucket or github) account"
echo "                                                                   "
cat ~/.ssh/id_rsa.pub
echo "                                                                   "
echo "run ssh  T git@bitbucket.org to verify after adding."