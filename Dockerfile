# AngularJs development container

# Use nodejs LTS version
FROM node:10.13.0

# Chrome binary for e2e
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get update && apt-get install -y --force-yes fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libgdk-pixbuf2.0-0 libnspr4 libnss3 libx11-xcb1 libxss1 xdg-utils
RUN dpkg -i google-chrome*.deb

# Set constants
ENV ANGULAR_CLI_VERSION=7.0.3

# Create a working directory
RUN mkdir /app

# Install Angular CLI globally
RUN npm install -g @angular/cli@"$ANGULAR_CLI_VERSION"


COPY package.json /app
# Set this directory as default
WORKDIR /app

# Setting up npm dependencies
RUN npm install
COPY . /app

EXPOSE 4200
