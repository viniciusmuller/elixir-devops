FROM elixir:1.13.4-alpine

WORKDIR /app
COPY mix.exs mix.lock /app
RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

# install runtime dependencies
RUN apk add --update bash openssl postgresql-client
RUN mix do deps.get, deps.compile

# TODO: entrypoint script and release build
CMD ["/app/entrypoint.sh"]
