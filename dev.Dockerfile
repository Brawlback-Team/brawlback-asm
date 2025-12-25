# Dockerfile reference: https://docs.docker.com/reference/dockerfile/

# https://hub.docker.com/_/ubuntu/
# use the Ubuntu image because it provides fairly recent packages
FROM ubuntu:latest


# install dependencies, tools
COPY ./tools/requirements.txt ./tools/requirements.txt
RUN apt-get update && apt-get install -y python3 python3-pip git
RUN python3 -m pip install --break-system-packages --user -r tools/requirements.txt
# remove requirements.txt
RUN rm -rf ./tools


# prevent the container from exiting to allow development in it
CMD ["sleep", "infinity"]