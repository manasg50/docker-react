#specify a base image
FROM node:alpine as builder

#specify a Working directory for container

WORKDIR '/usr/app'

# copy package.json to current working directory i.e WORKDIR /usr/app 

COPY ./package.json ./

#download and install a dependency 
RUN npm install

#copy everything from our project directory i.e Frontend folder files  to current directory 
COPY ./ ./


#tell the image what to do when it starts as a container 
RUN npm run build

FROM nginx 
COPY --from=builder /usr/app/build /usr/share/nginx/html