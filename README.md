# Bootstrap Server

## Description
This document describes how to set up the server from scratch. Most of the main applications necessary have been 
installed automatically using the bash file. The document will guide you from creating a new server instance on Google cloud
or any prefered cloud service provider to setting up the entire environment.

## Installation

### Create a Cloud Server Instance
You need to create a new cloud server instance . This tutorial focuses on using Google cloud server. Go to VM instances, then
 create a new VM instance. The specs of the server should be a debian 9 linux server. 20gb server space, 
1 vCPU, 3.75 GB memory is sufficient.


### Make the IP static.
You need to reserve the IP address. Usually the external IP addresses of servers change by default unless you reserve it. hence 
you reserve it. On GCP, go to External IP addresses under the VPC network section of google cloud. Then locate the instance
you created. Change the from epipheral to static. 

### Forward DNS to IP
Go to your nameservers provider and forward your domain name or sub-domain to the IP address

### Install bootstrap.sh file
SSH into the server. Create a folder codebase in the root directory. Then create a new file setup.sh inside it.
```
cd /
mkdir codebase
sudo nano setup.sh
```
Copy the content of the file server_bootstrap@debian.sh in this repo into it and save.
Create a nginx.conf file
```
sudo nano nginx.conf
```
Copy the content of nginx.conf in the repo into the newly created file nginx.conf. Edit every place necessary like the subdomain
or domain you are using. If you need to change the port to another port, you can change it here.

### Run the bash file
Make sure you change the subdomain you pass. For example we are using *dev.talkabyte.com* here. It can be any domain or subdomain 
of your choice
```
sudo sh setup.sh dev.talkabyte.com
```
### Pull project from repo
Pull the project repo into the folder codebase. Cd into it and create .env file.
fill the .env file as appropriate
Test the domain if all is working.

