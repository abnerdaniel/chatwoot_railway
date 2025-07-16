# https://hub.docker.com/r/chatwoot/chatwoot/tags
FROM ruby:3.1

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn git

# Clona seu repositório
RUN git clone https://github.com/abnerdaniel/chatwoot.git /app

WORKDIR /app

# Instala gems
RUN gem install bundler && bundle install

# Instala dependências JS
RUN yarn install

# Copia o start.sh (caso queira customizar)
COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]
CMD ["start.sh"]