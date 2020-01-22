## Multibase image to build in production 
## Build phase  
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build 

## The folder of the build it's inside /app/build
## Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

