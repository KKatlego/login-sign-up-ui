FROM node:14

WORKDIR /srv

COPY package.json ./

RUN npm install

COPY . .

CMD ["node", "index.js"]