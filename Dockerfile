## BUILDING
##   (from project root directory)
##   $ docker build -t ruby-for-mattlk13-openssl .
##
## RUNNING
##   $ docker run -p 3000:3000 ruby-for-mattlk13-openssl
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="gdxu95s" \
    STACKSMITH_STACK_NAME="Ruby for Mattlk13/openssl" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 libssl1.0.0 zlib1g libreadline6 libncurses5 libtinfo5 libffi6 libxml2-dev zlib1g-dev libxslt1-dev libgmp-dev ghostscript imagemagick libmysqlclient18 libpq5

RUN bitnami-pkg install ruby-2.4.0-1 --checksum c42ef6b39fe67b3fc60e41e42aa5d3a39de0f714069369a15342ceed0b53a6a5

ENV PATH=/opt/bitnami/ruby/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Ruby base template
COPY Gemfile* /app/
WORKDIR /app

RUN bundle install

COPY . /app

CMD ["irb"]
