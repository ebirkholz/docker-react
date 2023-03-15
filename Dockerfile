FROM node:16-alpine as Builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
###### END of Builder ########

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html



