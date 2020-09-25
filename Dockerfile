FROM ruby:2.7.1-slim

#RUN apt-get update && apt-get install -y unzip xvfb libxi6 libgconf-2-4
RUN apt-get update
#RUN apt-get install -y libpng-dev
#RUN apt-get install -y --reinstall zlibc zlib1g zlib1g-dev

RUN apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

COPY . /application
ENV RAILS_ENV development

WORKDIR /application

RUN bundle install


ENTRYPOINT ./entrypoint.sh
