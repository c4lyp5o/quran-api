# pull the Node.js Docker image
FROM node:alpine

# add timezone data
RUN apk add --no-cache tzdata

# set timezone data
ENV TZ=Asia/Kuala_Lumpur

# create the directory inside the container
WORKDIR /usr/src/app

# copy the package.json files from local machine to the workdir in container
COPY package*.json ./

# copy the generated modules and all other files to the container
COPY . .

# our app is running on port 8002 within the container, so need to expose it
EXPOSE 8002

# the command that starts our app
CMD ["npm", "run", "start"]