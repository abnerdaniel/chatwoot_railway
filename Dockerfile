# https://hub.docker.com/r/chatwoot/chatwoot/tags
FROM ruby:3.1-slim

# Instala dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      libvips \
      nodejs \
      postgresql-client \
      yarn \
      git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Clona seu repositório
RUN git clone https://github.com/abnerdaniel/chatwoot.git /app

WORKDIR /app

# Instala gems
RUN gem install bundler:2.4.22

# Instala dependências JS
RUN yarn install

# Copia o start.sh (caso queira customizar)
COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]
CMD ["start.sh"]