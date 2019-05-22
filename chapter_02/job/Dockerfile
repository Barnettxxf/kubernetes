# Specify BROKER_URL and QUEUE when running
FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl ca-certificates amqp-tools python \
       --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
COPY ./worker.py /worker.py
COPY ./worker.sh /worker.sh

CMD /worker.sh
