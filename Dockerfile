FROM python:3.10.10-slim

# install wget, gnupg2, curl
RUN apt-get update \
 && apt-get install wget unzip zip -y
RUN apt-get update && apt-get install -y gnupg2
RUN apt-get install curl -y

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# install psycopg
RUN apt-get -y install libpq-dev gcc
RUN apt-get update

COPY ./requirements.txt /

RUN pip install -r /requirements.txt

ENV TZ="Asia/Taipei"