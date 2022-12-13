#Building
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY /home/beni/reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
