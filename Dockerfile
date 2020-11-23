########################################################################################################################
#
#	THIS IS A DOCKERFILE FOR IMAGE WITH PYTHON 3 AND INSTALLED ADDONS FOR USAGE BY ACCEPTANCE-INTERATION-TESTS
#
########################################################################################################################


FROM python:3.8.6-buster

MAINTAINER msakharov@zoon.ru

ENV TZ=Europe/Moscow
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    rsync \
    vim \
    pipenv \
    && rm -rf /var/lib/apt/lists/*

COPY Pipfile /acceptance-tests-core-dir/

WORKDIR /acceptance-tests-core-dir/
### See your workdir content
RUN ls -lah

### Install dependencies from Pipfile
RUN set -ex && pipenv install