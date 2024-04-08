# Use the official PHP image with Apache and PHP 8.2
FROM --platform=linux/amd64 php:8.2-apache

ENV NODE_VERSION=16.13.0

RUN apt-get update && apt-get install -y \
    wget \
    gnupg2 \
    zip \
    unzip \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    libzip-dev  \
    zip \
    libnss3 \
    libglib2.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libgdk-pixbuf2.0-0 \
    libpango-1.0-0 \
    libcairo2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    --no-install-recommends \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory in the container
WORKDIR /var/www/App

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Java
RUN apt update -q && \
    apt install -y -q openjdk-17-jre openjdk-17-jdk-headless && \
    apt install -y -q fontconfig fonts-dejavu

# Install Node
ENV NODE_VERSION=16.13.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

# Install Google Chrome
RUN apt-get update && apt-get install -y wget gnupg2 && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# Setup ChromeDriver
ARG CHROMEDRIVER_VERSION=114.0.5735.90

# Install ChromeDriver
RUN wget -q https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && rm chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin/
RUN wget -q -O google-chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_114.0.5735.90-1_amd64.deb \
    && dpkg -i google-chrome.deb \
    && apt-get install -y -f \
    && rm google-chrome.deb
