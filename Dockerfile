FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# notes:
# /app/build <-- everything we need

# For the deployement of the production server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html