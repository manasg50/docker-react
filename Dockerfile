#specify a base image
FROM node:alpine

#specify a Working directory for container

WORKDIR '/usr/app'

# copy package.json to current working directory i.e WORKDIR /usr/app 

COPY ./package*.json ./

#download and install a dependency 
RUN npm install

#copy everything from our project directory i.e Frontend folder files  to current directory 
COPY ./ ./


#tell the image what to do when it starts as a container 
RUN npm run build

FROM nginx 
# Expose 80 is for elastic bean stalk port mapping on AWS console 
EXPOSE 80 
COPY --from=0 /usr/app/build /usr/share/nginx/html