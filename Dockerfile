#Building
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build_stage /home/beni/reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
