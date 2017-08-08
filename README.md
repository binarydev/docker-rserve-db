# Description

Includes a Dockerfile for running a self-container Rserve instance on the default 6311 port, with dependencies for vectorized processing and MySQL/PostgreSQL client installed. A default Rprofile file defining the cloud CRAN mirror is created as well.

# Installation with Docker

### Step 1: Acquire the image

- Clone this repo and create a new image with an arbitrary name
```
git clone https://github.com/binarydev/docker-rserve-db.git
cd docker-rserve-db
sudo docker build --tag <arbitrary-name>:3.3.1 .
```

OR

- Pull the latest image from DockerHub
```
sudo docker pull binarydev/docker-rserve-db
```

### Step 2: 

- Create a New Container With the Image
```
sudo docker run -itd --name <arbitrary-container-name> -p 6311:6311 -v <local-R-package-dir>:/local_R_packages <arbitrary-image-name>:3.3.1  
```
* Arguments:
  * **Local R package dir (required, even if empty dir):** The full path to your local directory containing R packages. For example, in my own Rails apps, this is typically ```/home/binarydev/Projects/<project-name>/vendor/R_packages```

*NOTE:* On container start, depending on the density of your local packages, it may take a minute to finish installing them. If you start the container in detached mode (the -d flag for docker run), and receive a failure message when trying to connect to R, please wait one minute to allow package installation to complete, then try again. You can follow the status of package installation using ```docker logs -f <container_name>```
