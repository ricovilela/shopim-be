FROM node:17.1.0

WORKDIR /app/medusa

COPY package.json .
COPY develop.sh .
COPY yarn.* .

RUN apt-get update

RUN apt-get install -y python

RUN npm install -g npm@8.1.2

RUN npm install -g @medusajs/medusa-cli@latest

RUN yarn --silent

COPY . .

RUN medusa migrations run

EXPOSE 9000

CMD ["medusa","start"]