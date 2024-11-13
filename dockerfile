# Gunakan image Node untuk build tahap awal
FROM node:18 AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source
COPY . .

# Build the react application
RUN npm run build

# Gunakan image minimal untuk menyajikan hasil build
FROM nginx:stable-alpine

# Salin hasil build ke direktori root NGINX
COPY --from=build /usr/src/app/build /usr/share/nginx/html

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Ekspos port 80
EXPOSE 80
