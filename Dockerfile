FROM adoptopenjdk/openjdk11:ubi
USER root
RUN groupadd -r docker
RUN useradd -r -u 1001 -g docker spring
RUN usermod -aG docker spring
RUN newgrp docker
USER spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]