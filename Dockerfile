FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


FROM nginx
# Used by AWS Elastic Beanstalk to automatically map the port
# with the external services
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
# default command from nginx is the start of the server


