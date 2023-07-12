FROM ruby:3.1.1-alpine

RUN apk add --no-cache \
  git \
  bash \
  build-base \
  libxml2-dev \
  libxslt-dev \
  tzdata \
  openssl \
  postgresql-dev \
  libc6-compat

WORKDIR /app

COPY . .

RUN bundle install


ENTRYPOINT ["bin/rails"]
CMD ["server", "-b", "0.0.0.0"]

EXPOSE 3000