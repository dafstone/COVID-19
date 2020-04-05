FROM python:3.8-buster
ENV installer Miniconda3-latest-Linux-x86_64.sh
WORKDIR /data
RUN wget -nv https://repo.anaconda.com/miniconda/$installer
RUN bash $installer -b
ADD . .

