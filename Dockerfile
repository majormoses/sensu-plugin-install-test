FROM ruby:2.3-slim

# some basic stuff
RUN mkdir /usr/src/app
ADD ./app /usr/src/app
WORKDIR /usr/src/app

CMD ["/usr/src/app/install_packages.sh"]
