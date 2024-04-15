FROM atlassian/bamboo-server:7.0.4
WORKDIR /home/bamboo/
ARG DOCKER_GID=998
USER root
# Install Docker binaries
RUN curl -O https://download.docker.com/linux/static/stable/x86_64/docker-19.03.9.tgz \
&& tar -xzf docker-19.03.9.tgz \
&& rm docker-19.03.9.tgz \
&& mv docker/* /usr/bin/ \
&& rmdir docker
# Add bamboo to the docker group
RUN groupadd -g ${DOCKER_GID} docker \
&& usermod -aG docker bamboo
USER bamboo
