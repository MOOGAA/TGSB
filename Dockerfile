FROM ubuntu:20.04

RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -qq update && \
	apt-get -y upgrade && \
	apt install -y wget curl busybox npm p7zip && \
	curl https://rclone.org/install.sh | bash && \
	curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq && \
	chmod +x /usr/local/bin/jq && \
	apt install -y make build-essential && \
	apt-get -qq install -y git python3.9 nmap docker.io
#
COPY . .

#Runs npm install
RUN npm install
#Starts the bot
CMD node server
