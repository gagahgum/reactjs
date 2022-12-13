WORKDIR /reactjs as build_stage

#Building
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build_stage /reactjs/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
