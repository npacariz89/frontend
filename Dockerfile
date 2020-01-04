FROM node:alpine as builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build



FROM nginx as deploy 
COPY --from=builder  /app/build /usr/share/nginx/html


