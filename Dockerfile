FROM node:18-alpine

WORKDIR /app

COPY app/package.json ./
RUN npm install

COPY app/ .

# HEALTHCHECK — controlla l’endpoint /health
HEALTHCHECK --interval=5s --timeout=3s --retries=5 \
 CMD wget -qO- http://localhost:3000/health || exit 1

EXPOSE 3000
CMD ["node", "server.js"]

