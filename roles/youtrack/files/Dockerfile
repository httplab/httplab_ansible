FROM java:latest

MAINTAINER Sergey Kovalevsky <sk@httplab.ru>

COPY entry-point.sh /entry-point.sh

ENV YOUTRACK_VERSION 6.5.17105

RUN mkdir -p /opt/youtrack/data /opt/youtrack/backup /opt/youtrack/bin

WORKDIR /opt/youtrack

RUN apt-get update && rm -rf /var/lib/apt/lists/*

# Download and extract youtrack files
RUN echo "$YOUTRACK_VERSION" > version.docker.image && \
    curl -L https://download.jetbrains.com/charisma/youtrack-${YOUTRACK_VERSION}.zip > youtrack.zip && \
    unzip youtrack.zip && \
    rm -f youtrack.zip && \
    chmod +x /entry-point.sh

EXPOSE 8080
ENV HOME /opt/youtrack

ENTRYPOINT ["/entry-point.sh"]
CMD ["run"]