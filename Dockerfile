# Resolving following docker run warning on Raspberry Pi 4 (arm v7 32bit):
# OpenJDK Server VM warning: No monotonic clock was available - timed services may be
# adversely affected if the time-of-day clock changes
# https://github.com/AdoptOpenJDK/openjdk-docker/issues/469
# Underlying issue: https://github.com/tianon/docker-brew-ubuntu-core/issues/196
# Fix for issue: https://packages.debian.org/sid/armhf/libseccomp2/download
FROM adoptopenjdk:11-jre-hotspot
USER root
RUN groupadd -r docker
RUN useradd -r -u 1001 -g docker spring
RUN usermod -aG docker spring
RUN newgrp docker
USER spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]