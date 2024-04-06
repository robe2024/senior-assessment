FROM node:18-alpine as build

WORKDIR /app

COPY package.json .
RUN npm install
RUN npm install -g @angular/cli

COPY . .

RUN ng build

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/dist .

EXPOSE 4200

CMD ["ng", "serve"]