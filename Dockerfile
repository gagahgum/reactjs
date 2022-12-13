FROM node:alpine as build_stage
WORKDIR /reactjs

#Building
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build_stage /reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
