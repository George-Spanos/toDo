FROM node:20.11-alpine as install
WORKDIR /app
RUN npm i -g pnpm@8.15.4
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

FROM install as build
WORKDIR /app
COPY . .
RUN pnpm build

FROM nginx:1.25.4-alpine

COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port
EXPOSE 80

# Use the default Nginx server block
CMD ["nginx", "-g", "daemon off;"]