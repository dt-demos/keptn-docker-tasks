FROM alpine:3.10.3

RUN apk --no-cache add \
    bash \
    jq

RUN apk add curl

# install Keptn *************************************

ENV KEPTN_VERSION="0.7.0"
RUN curl https://raw.githubusercontent.com/robertjahn/get.keptn.sh/master/src/get.sh -o /tmp/get.sh
RUN chmod +x /tmp/get.sh
RUN ./tmp/get.sh

# update to this once PR is merged
#export KEPTN_VERSION="0.7.0" && curl -sL https://get.keptn.sh | sudo -E bash

ENV PATH="/usr/local/bin:${PATH}"

# copy in scripts **********************************

COPY prepareproject.sh /
COPY qualitygate.sh /
