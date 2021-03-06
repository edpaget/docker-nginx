# DOCKER-VERSION 0.9.0
# VERSION 0.1.0

FROM ubuntu:12.04
MAINTAINER Edward Paget <ed@zooniverse.org>

RUN apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties
RUN add-apt-repository ppa:nginx/stable

RUN apt-get update
RUN apt-get install -y -q nginx supervisor
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /var/log/supervisor

RUN rm /etc/nginx/sites-enabled/default
ADD storm_ui.conf /etc/nginx/sites-enabled/storm_ui
ADD events.conf /etc/nginx/sites-enabled/events
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /etc/nginx

EXPOSE 80

