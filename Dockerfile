FROM node:alpine as mbuilder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
COPY --from=mbuilder /app/build /usr/share/nginx/html