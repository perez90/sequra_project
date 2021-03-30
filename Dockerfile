FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /sequra_project
COPY Gemfile /sequra_project/Gemfile
COPY Gemfile.lock /sequra_project/Gemfile.lock
RUN bundle install
COPY . /sequra_project


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]