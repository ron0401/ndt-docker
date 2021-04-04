#!/bin/bash

#  docker run -it -v $(pwd)/temp:/temp -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) robot:melodic /bin/bash
# docker run -it -e USER_ID=$(id -u $USER) -e GROUP_ID=$(id -g $USER) robot:melodic /bin/bash
#  docker run -it robot:melodic /bin/bash

# docker run --rm -t -i --net host robot:melodic /bin/bash
docker run --rm -t -i --net host robot:melodic
# docker run --rm -t -i robot:melodic /bin/bash -c "roscore"
# docker run --rm -t -i --net host robot:melodic /bin/bash -c "roscore"