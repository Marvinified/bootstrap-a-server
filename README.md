# Bootstrap Server

## Description
This document describes how to use the bash script in this repository to setup a new server with the following require application:

The script install the following 
 - git and generates an ssh key.
 - docker and docker compose
 - nginx and cerbot
 - configure and install ssl certs 
 
## Installation

### Create a Linux Server
You need to create a new cloud server instance . Go to VM instances, then create a new VM instance. The server should be a `debian 9 linux server`.


### Make the IP static. (Google CLoud Platform Only)
You need to reserve the IP address. Usually the external IP addresses of servers change by default unless you reserve it. hence 
you reserve it. On GCP, go to External IP addresses under the VPC network section of google cloud. Then locate the instance
you created. Change the from epipheral to static. 

### Forward DNS to IP
Go to your DNS provider and forward your domain name or sub-domain to the IP address, (this allows the ssl certificate installer to verify ownership of the domain), Make sure you do this if you want ssl cert installed succesfully.

### Edit Nginx.conf file
Create a nginx.conf file
```
sudo nano nginx.conf
```

Copy the content of nginx.conf in the repo into the newly created file nginx.conf. Edit every place necessary like the subdomain
or domain you are using. If you need to change the port to another port, you can change it here.

### run bootstrap script
SSH into the server. Create a folder codebase in the root directory. Then create a new file setup.sh inside it.

```bash
  cd /
  mkdir codebase
  sudo nano setup.sh
```

Copy the content of the file server_bootstrap@debian.sh in this repo into it and save.

### Run the bash file
Make sure you change the subdomain argument you pass. For example we are using *dev.talkabyte.com* here. It can be any domain or subdomain 
of your choice

```bash
sudo sh setup.sh dev.talkabyte.com
```
### Add ssh key to your git provider (github or bitbucket or others)

After succesful running of the script an `ssh key` would be displayed on the console add it to your account ssh key

- For Github: https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
- For Bitbucket: https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account

### clone project from repo
- Clone your project and run  ( make sure it is running on port specified in the `nginx.conf`.)

