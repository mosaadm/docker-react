FROM node:alpine as mbuilder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=mbuilder /app/build /usr/share/nginx/html