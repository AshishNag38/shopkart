FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 2001

# Specify the command to run your app
CMD ["npm", "start"]