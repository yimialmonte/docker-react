# Build fase
FROM node:16-alpine AS builder

COPY package.json .

WORKDIR /app

RUN npm install

COPY . .

RUN npm run build

# Run stage
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html



