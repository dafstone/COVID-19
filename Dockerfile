FROM python:3.8-buster
WORKDIR /data
ADD requirements.txt .
RUN pip install -r requirements.txt
ADD . .
WORKDIR /data/code
CMD ["python", "./Covid-19_v1.py"]
