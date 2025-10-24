# ==============================
# 1️⃣ Build stage
# ==============================
FROM node:20 AS build

WORKDIR /app

# Copy only package files
COPY package*.json ./

# Install all dependencies (dev included for build)
RUN npm ci

# Copy rest of the frontend source
COPY . .

# Copy environment variables (if any)
COPY .env.sample .env

# Build production static files
RUN npm run build

# ==============================
# 2️⃣ Production stage
# ==============================
FROM node:20-slim AS production

WORKDIR /app

# Install only production dependencies (needed if your preview uses node)
COPY package*.json ./
RUN npm install --omit=dev --ignore-scripts

# Copy build output
COPY --from=build /app/dist ./dist

# Copy environment if needed (optional)
COPY --from=build /app/.env .env

# Expose port for preview
EXPOSE 5173

# Start frontend in preview mode (production)
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "5173"]
