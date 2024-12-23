
# dockerfile for Linux based containers:
# FROM node:18

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# EXPOSE 1010

# Specify the command to run your app
# CMD ["npm", "start"]

# dockerfile for Window based containers:
FROM mcr.microsoft.com/windows/servercore:ltsc2022 as base

WORKDIR /app

COPY package*.json ./ 

RUN powershell -Command \
  Set-ExecutionPolicy Bypass -Scope Process -Force; \
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
  choco install -y nodejs-lts

RUN npm install

COPY . .

EXPOSE 1010

CMD ["npm", "start"]
