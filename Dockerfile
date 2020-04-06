FROM python:3.8-buster
WORKDIR /data
ADD requirements.txt .
RUN pip install -r requirements.txt
ADD . .
