FROM ubuntu:22.10

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install openjdk-17-jdk openjdk-17-jre -y

EXPOSE 25565

RUN useradd -ms /bin/bash minecraft
ENV HOME=/home/minecraft
USER minecraft

WORKDIR $HOME/server

USER root

COPY forge.jar .
COPY eula.txt .
RUN chown -R minecraft:minecraft /home/minecraft

USER minecraft

RUN java -jar forge.jar --installServer
RUN rm -rf forge.jar

ENTRYPOINT ["./run.sh"]


