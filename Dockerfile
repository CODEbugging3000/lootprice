###########################################################
# Multi-stage Dockerfile for LootPrice Microservices
# - Frontend: Next.js
# - Backend: Node.js (Express)
# - Scraper: Python
# Each service can be built separately or together
###########################################################

# ---- FRONTEND (Next.js) ----
FROM node:20 AS frontend-builder
WORKDIR /app/frontend/lootprice
COPY frontend/lootprice/package.json frontend/lootprice/pnpm-lock.yaml* ./
RUN npm install -g pnpm && pnpm install
COPY frontend/lootprice/ ./
RUN pnpm build

# ---- BACKEND (Node.js) ----
FROM node:20 AS backend-builder
WORKDIR /app/backend
RUN mkdir -p api-gateway
# Copy only source files, excluding node_modules and build artifacts
COPY backend/api-gateway/package.json backend/api-gateway/pnpm-lock.yaml* api-gateway/
COPY backend/api-gateway/prisma/ api-gateway/prisma/
RUN npm install -g pnpm && cd api-gateway && pnpm install && npx prisma generate
# Use .dockerignore to exclude node_modules and @prisma/client
COPY backend/api-gateway/ api-gateway/
# Add similar blocks for other backend services as needed
RUN cd api-gateway && pnpm build

# ---- SCRAPER (Python) ----
FROM python:3.11 AS scraper-builder
WORKDIR /app/scraper
COPY backend/scraper/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/scraper/ .

# ---- FINAL IMAGE EXAMPLES ----
# You can create runtime images for each service as needed
# Example: Frontend runtime
FROM node:20-alpine AS frontend-runtime
WORKDIR /app
COPY --from=frontend-builder /app/frontend/lootprice/.next ./.next
COPY --from=frontend-builder /app/frontend/lootprice/public ./public
COPY --from=frontend-builder /app/frontend/lootprice/package.json ./
RUN npm install -g pnpm && pnpm install --prod
EXPOSE 3000
CMD ["pnpm", "start"]

# Example: Backend runtime (api-gateway)
FROM node:20-alpine AS api-gateway-runtime
WORKDIR /app/api-gateway
COPY --from=backend-builder /app/backend/api-gateway .
# Ensure pnpm is installed globally in runtime image
RUN npm install -g pnpm
EXPOSE 8000
CMD ["node", "dist/index.js"]

# Example: Scraper runtime
FROM python:3.11-slim AS scraper-runtime
WORKDIR /app
COPY --from=scraper-builder /app/scraper .
EXPOSE 5000
CMD ["python", "main.py"]
