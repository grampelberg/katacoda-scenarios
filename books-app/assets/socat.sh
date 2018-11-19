#!/bin/bash

socat tcp-listen:9091,reuseaddr,fork tcp:localhost:9090 &
socat tcp-listen:9093,reuseaddr,fork tcp:localhost:9092
