FROM node:22-alpine@sha256:8094c002d08262dba12645a3b4a15cd6cd627d30bc782f53229a2ec13ee22a00
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --production
COPY . .
ARG VERSION=dev
ENV VERSION=$VERSION
EXPOSE 3000
CMD ["sh", "-c", "npm run migrate && npm start"]
