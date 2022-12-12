#Building
FROM node:alpine as build_stage
WORKDIR /reactjs
COPY package.json package.json
RUN npm install
COPY . .
RUN npm build

#Deploying
FROM nginx:alpine as deploy_stage
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build_stage /reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
