########################################################################################################################
#
#	THIS IS A DOCKERFILE FOR IMAGE WITH PYTHON 3 AND INSTALLED ADDONS FOR USAGE BY ACCEPTANCE-INTERATION-TESTS
#
########################################################################################################################


FROM python:3.9.2-buster

MAINTAINER msakharov@zoon.ru

RUN apt-get update -qq

RUN apt-get install -y --no-install-recommends software-properties-common apt-utils wget openssl libgssapi-krb5-2 \
    tzdata locales curl

RUN echo "Europe/Moscow" > /etc/timezone \
    && rm -f /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# Install some needed packages
RUN pip3 install pipenv tqdm pre-commit && rm -rf /var/lib/apt/lists/*

RUN mkdir /acceptance-tests-core-dir
WORKDIR /acceptance-tests-core-dir/