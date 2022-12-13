#Building
FROM nginx:alpine
WORKDIR /reactjs
COPY /reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
