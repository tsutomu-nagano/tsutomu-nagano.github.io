FROM node:22-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm install

FROM node:22-alpine AS runner
WORKDIR /app
ENV HOST=0.0.0.0
ENV PORT=5174
COPY --from=deps /app/node_modules ./node_modules
COPY . .
EXPOSE 5174
CMD ["npm", "run", "dev"]
