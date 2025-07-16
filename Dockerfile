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
      python3 \
      python3-pip \
      python3-setuptools \
      make \
      gcc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instala Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Clona seu repositório
RUN git clone https://github.com/abnerdaniel/chatwoot.git /app

WORKDIR /app

# Instala gems
RUN gem install bundler:2.4.22

# Instala dependências JS
RUN yarn install || { cat yarn-error.log; exit 1; }

# Copia o start.sh (caso queira customizar)
COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]
CMD ["start.sh"]