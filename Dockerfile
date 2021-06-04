# syntax = docker/dockerfile:1.0-experimental
FROM node:14.15-alpine as dependencies

WORKDIR /usr/src/build
COPY package.json package-lock.json ./
RUN --mount=type=secret,id=npmrc,dst=/root/.npmrc npm install


FROM node:14.15-alpine

RUN apk add --no-cache git
WORKDIR /usr/src/app
COPY --from=dependencies /usr/src/build/node_modules ./node_modules
COPY . .
RUN npm run build

EXPOSE 3000

ARG DEV_BUILD
# if --build-arg DEV_BUILD=1, set RUN_CMD to 'dev' or set to null otherwise.
ENV RUN_CMD=${DEV_BUILD:+dev}
# if DEV_BUILD is null, set it to 'start' (or leave as is otherwise).
ENV RUN_CMD=${RUN_CMD:-start}
CMD ["sh", "-c", "npm run ${RUN_CMD}"]
