#!/bin/bash
/usr/bin/amqp-consume --url $BROKER_URL -q $QUEUE -c 1 /worker.py
