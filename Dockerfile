FROM ruby:2.3

RUN mkdir -p /opt/site
WORKDIR /opt/site

COPY Gemfile* ./
RUN bundle install

VOLUME /opt/site

EXPOSE 4000

CMD jekyll serve --trace --verbose --host 0.0.0.0
