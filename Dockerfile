FROM node:10

RUN apt-get update 

RUN apt-get install sudo -y

RUN sudo apt-get install apache2 -y

WORKDIR /var/www/html

COPY package*.json ./

RUN npm install

RUN sudo rm index.html

## RUN sudo apt-get install systemctl -y

RUN service apache2 start

COPY . .

EXPOSE 9999

CMD ["node", "server.js"]
