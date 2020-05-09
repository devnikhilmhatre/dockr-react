FROM node:14.2.0-alpine3.11 as base
WORKDIR /app
COPY . .
RUN npm i
RUN npm run build


FROM nginx:stable-alpine
COPY --from=base /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]