FROM tomcat:jdk17-temurin-jammy
ENV LANG ja_JP.UTF-8

RUN apt update
RUN apt-get install -y wget zip sudo mysql-client

# mavenをインストールしてPATHを通す
WORKDIR /tmp
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip
RUN unzip apache-maven-3.8.6-bin.zip
RUN mv apache-maven-3.8.6 /usr/local/maven
ENV PATH $PATH:/usr/local/maven/bin

# 初期ディレクトリ
WORKDIR /app/src