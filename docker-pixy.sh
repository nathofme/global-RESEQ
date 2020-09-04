### pixy
# https://github.com/ksamuk/pixy
# downloaded on 9/4/20
# NOTE: pixy is currently in active development and has not undergone peer review.
# MS: https://www.biorxiv.org/content/10.1101/2020.06.27.175091v1


############# Docker setup ############

# setting up Docker on BioHPC machine (Cornell-specific need)
docker1 pull biohpc/ubuntudev # standard ubuntu linux image

## Using default tag: latest
## latest: Pulling from biohpc/ubuntudev
## fbd58f7b7e99: Pull complete
## 0c9abf5b9fac: Pull complete
## c5ed10a86d6c: Pull complete
## 4d4e066a55d4: Pull complete
## Digest: sha256:cae26ce8361070f2e39d3a6f359d1d6da9a5afa38b3a0558c3217ed1fde5320b
## Status: Downloaded newer image for biohpc/ubuntudev:latest
## docker.io/biohpc/ubuntudev:latest

# check which images available
docker1 images
## REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
## biohpc/ubuntudev    latest              cd24b4f63591        11 days ago         1.85GB

docker1 run -d -it docker.io/biohpc/ubuntudev /bin/bash # -d flag to run in background
## 5382edff235a119e914bab48ec31dfb9fb134743c76ba1d850fc39290f706d55
docker1 ps -a # get container name (e.g., d3b7d7463857)

## CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
## 5382edff235a        biohpc/ubuntudev    "/bin/bash"         11 seconds ago      Up 9 seconds                            nrh44__biohpc_1

docker1 exec -it 5382edff235a /bin/bash # Replace d3b7d7463857 with the actual container name
apt-get update
apt-get upgrade

### now you're in an interactive shell and can install software
### because pixy requires conda install, saved docker image to go install conda in home dir
### will import image to actually install pixy after conda set up

### save docker image so you can use pixy again
exit
docker1 export -o /home/nrh44/pixy.tar 5382edff235a

### got to this point on 9/4 2pm
### need to figure out how to set up conda environment in docker 

############# pixy install ############

# for biohpc, install in your home directory!
# downloaded Python 3.8	Miniconda3 Linux 64-bit from https://conda.io/miniconda.html
# in /home/nrh44:
bash Miniconda3-latest-Linux-x86_64.sh

source $HOME/miniconda3/bin/activate

# add conda-forge as a channel (if you haven't already):
conda config --add channels conda-forge
# then install pix
conda install pixy

# test your pixy installation by running:
pixy --help
