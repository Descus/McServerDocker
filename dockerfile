FROM ubuntu:22.10

ARG DEBIAN_FRONTEND=noninteractive
ARG JAR_LOCATION=./forge.jar
ARG UID=1000
ARG GID=1000

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install openjdk-17-jdk openjdk-17-jre -y

EXPOSE 25565

RUN useradd minecraft -ms /bin/bash -u $UID
RUN groupmod -g $GID minecraft
ENV HOME=/home/minecraft
USER minecraft

WORKDIR $HOME/server

USER root

COPY ${JAR_LOCATION} ./forge.jar
COPY eula.txt .
RUN chown -R minecraft:minecraft /home/minecraft

USER minecraft

RUN java -jar forge.jar --installServer
RUN rm -rf forge.jar

ENTRYPOINT ["./run.sh"]


