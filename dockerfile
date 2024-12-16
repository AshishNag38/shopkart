# Use a Windows Server Core image as the base
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set working directory
WORKDIR /app

# Install Node.js
RUN powershell -Command \
  Invoke-WebRequest -Uri https://nodejs.org/dist/v18.0.0/node-v18.0.0-x64.msi -OutFile nodejs.msi; \
  Start-Process msiexec.exe -ArgumentList '/i', 'nodejs.msi', '/quiet', '/norestart' -NoNewWindow -Wait; \
  Remove-Item -Force nodejs.msi

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the port your app runs on
EXPOSE 1010

# Specify the command to run your app
CMD ["npm", "start"]
