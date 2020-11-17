#
# Build www.pascom.net documentation
#
# a multistage dockerfile:
#
# 1. create a builder with hugo binary
#    use it to render the homepage content
#
# 2. build actual documentation container
#
#
# build:
#  podman build --build-arg baseUrl=http://10.5.6.20:8888 --build-arg mypascom=https://my.pascom-dev.net -t documentation:latest .
#
# run:
#  podman run -it --rm -p 8888:80/tcp documentation


FROM debian:jessie as hugobuilder

# Install pygments (for syntax highlighting)
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates asciidoc curl wget \
	&& rm -rf /var/lib/apt/lists/*

## Fix for hugo extended

RUN wget -q -O libstdc++6 http://security.ubuntu.com/ubuntu/pool/main/g/gcc-5/libstdc++6_5.4.0-6ubuntu1~16.04.12_amd64.deb \
    && dpkg --force-all -i libstdc++6

# Download and install hugo
ENV HUGO_VERSION 0.55.6
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir /usr/share/site

WORKDIR /usr/share/site

# Automatically build site
ADD . /usr/share

# Allow to override baseUrl and others for test/dev stages
ARG baseUrl=www.pascom.net
RUN sed -i "s#https://www.pascom.net#${baseUrl}#g" /usr/share/site/config.toml

ARG mypascom=my.pascom.net
RUN sed -i "s#https://my.pascom.net#${mypascom}#g" /usr/share/site/config.toml

ARG doc=doc-productive
RUN sed -i "s#doc-productive#${doc}#g" /usr/share/site/config.toml

RUN hugo -d /usr/share/nginx/html

# Build and upload algolia index
FROM node:lts as algolia
COPY --from=hugobuilder /usr/share/nginx/html/de/index.json ./index.de.json
COPY --from=hugobuilder /usr/share/nginx/html/en/index.json ./index.en.json
ARG key
ARG doc=doc-productive
ADD package.json /package.json
RUN npm install webpack atomic-algolia
RUN ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=${key} \
    ALGOLIA_INDEX_NAME=${doc}-de \
    ALGOLIA_INDEX_FILE=index.de.json \
    npm run algolia
RUN ALGOLIA_APP_ID=GEETCE1DI1 \
    ALGOLIA_ADMIN_KEY=${key} \
    ALGOLIA_INDEX_NAME=${doc}-en \
    ALGOLIA_INDEX_FILE=index.en.json \
    npm run algolia

# Now create the runtime container
FROM nginx
# ... and copy the content from the builder into it
COPY --from=hugobuilder /usr/share/nginx/html /usr/share/nginx/html/doc
