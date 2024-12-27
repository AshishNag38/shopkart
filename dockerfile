
# dockerfile for Linux based containers:
# Use the Node.js 18 base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy the entire project directory, including node_modules
COPY . .

# Expose the application port
EXPOSE 1010

# Specify the command to run your app
CMD ["npm", "start"]


# dockerfile for Window based containers:
# FROM mcr.microsoft.com/windows/servercore:ltsc2022 as base

# WORKDIR /app

# COPY package*.json ./ 

# RUN powershell -Command \
#   Set-ExecutionPolicy Bypass -Scope Process -Force; \
#   [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
#   iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
#   choco install -y nodejs-lts

# RUN npm install

# COPY . .

# EXPOSE 1010

# CMD ["npm", "start"]
