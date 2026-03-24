FROM node:20-bookworm-slim

RUN apt-get update && apt-get install -y \
    imagemagick \
    webp \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm cache clean --force && \
    npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
