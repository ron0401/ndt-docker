#!/bin/bash

docker run --rm -t -i --net host robot:melodic /bin/bash -c "roscore"