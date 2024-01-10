# PHASE 1: build
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# build production version
RUN npm run build 

# PHASE 2: copy whaty was built and run it under NGINX
# copy from build to the NGINX service folder
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
