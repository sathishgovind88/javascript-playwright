#FROM node:20.9

# Get the latest version of Playwright
FROM mcr.microsoft.com/playwright:v1.49.1-jammy

# Set the work directory for the application
WORKDIR /app

# Set the environment path to node_modules/.bin
ENV PATH="/app/node_modules/.bin:$PATH"

# COPY the needed files to the app folder in Docker image
COPY acceptance/ /app/acceptance/
COPY reports/ /app/reports/
COPY package.json /app/
COPY cucumber.conf.js /app/
COPY cucumber_report.json /app/
COPY reporter.js /app/

# Get the needed libraries to run Playwright
RUN npx playwright install-deps

# Install the dependencies in Node environment
RUN npm install