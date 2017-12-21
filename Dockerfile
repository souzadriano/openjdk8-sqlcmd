FROM ubuntu:16.04

MAINTAINER Adriano de Souza "souzadriano@gmail.com"

ENV ACCEPT_EULA=Y
ENV LANG C.UTF-8

RUN apt-get update && \
	apt-get install -y curl apt-transport-https locales && \
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    	locale-gen && \
	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
	curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list && \
	apt-get update && \
	apt-get install -y mssql-tools unixodbc-dev && \
	ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd && \
	ln -sfn /opt/mssql-tools/bin/bcp /usr/bin/bcp
	
RUN apt-get install -y openjdk-8-jre

RUN apt-get install -y ssh-client
