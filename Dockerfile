FROM ubuntu:16.04

# some basic stuff
RUN mkdir /usr/src/app
ADD ./app /usr/src/app
WORKDIR /usr/src/app

CMD ["/usr/src/app/install_packages.sh"]
