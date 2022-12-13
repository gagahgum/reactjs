#Install
FROM node:alpine as build_stage
WORKDIR /reactjs
COPY package.json package.json
RUN npm install
COPY . /reactjs
RUN npm run build

#Deploy
FROM nginx:alpine as deploy
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build_stage /reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
