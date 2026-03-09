FROM node:24-alpine@sha256:7fddd9ddeae8196abf4a3ef2de34e11f7b1a722119f91f28ddf1e99dcafdf114
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --production
COPY . .
ARG VERSION=dev
ENV VERSION=$VERSION
EXPOSE 3000
CMD ["sh", "-c", "npm run migrate && npm start"]
