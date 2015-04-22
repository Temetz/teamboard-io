FROM library/ubuntu:14.04

MAINTAINER n4sjamk

RUN apt-get update && apt-get install -y nodejs npm

RUN ["useradd", "-m", "teamboard", "-u", "23456"]

ADD . /home/teamboard/teamboard-io

RUN chown -R teamboard:teamboard /home/teamboard/teamboard-io

USER teamboard

RUN cd /home/teamboard/teamboard-io && \
	npm install

RUN ["mkdir", "/home/teamboard/logs"]

CMD /usr/local/bin/node /home/teamboard/teamboard-io/index.js \
	2>> /home/teamboard/logs/teamboard-io.err \
	1>> /home/teamboard/logs/teamboard-io.log
