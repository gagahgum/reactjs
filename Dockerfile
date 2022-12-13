#Building
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY /var/lib/jenkins/workspace/deploy-react-js/reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
