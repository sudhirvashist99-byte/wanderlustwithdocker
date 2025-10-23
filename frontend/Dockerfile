FROM node:node21

WORKDIR /app

COPY . .

RUN npm i

COPY .env.sample .env

EXPOSE 5173

CMD ["npm","start"]