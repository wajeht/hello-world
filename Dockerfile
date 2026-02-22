FROM node:24-alpine@sha256:4f696fbf39f383c1e486030ba6b289a5d9af541642fc78ab197e584a113b9c03
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --production
COPY . .
ARG VERSION=dev
ENV VERSION=$VERSION
EXPOSE 3000
CMD ["sh", "-c", "npm run migrate && npm start"]
