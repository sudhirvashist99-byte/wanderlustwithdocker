FROM node:node21

WORKDIR /app

COPY . .

RUN npm i

COPY .env.sample .env

EXPOSE 5431

CMD ["npm","start"]