FROM python:3.8-buster
WORKDIR /data
RUN wget -nv https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
RUN bash Anaconda3-2020.02-Linux-x86_64.sh -b
RUN /root/anaconda3/bin/conda init
ADD . .

