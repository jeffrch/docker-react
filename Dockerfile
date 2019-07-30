FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# end of builder step

# we just copy the bare minimum from the built app
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html