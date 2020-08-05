#install os
FROM node:alpine as builder

#set directory
WORKDIR '/app'

#cache dependencies
COPY package.json .

#run
RUN npm install

#copy files 
COPY . . 

#start command
RUN npm run build


#setting up nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
