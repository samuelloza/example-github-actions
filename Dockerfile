FROM node:20 as builder

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

FROM starsaminf/angular-react-configs-nginx

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
