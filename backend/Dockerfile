# ==============================
# 1️⃣ Build stage
# ==============================
FROM node:20 AS build

WORKDIR /app

# Copy only package files first for caching
COPY package*.json ./

# Install ALL dependencies (including dev)
RUN npm install --ignore-scripts

# Copy the rest of the backend source
COPY . .

# Build TypeScript -> dist/
RUN npm run build

# ==============================
# 2️⃣ Production stage
# ==============================
FROM node:20-slim AS production

WORKDIR /app

# Copy only package files again
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev --ignore-scripts

# Copy compiled app and environment
COPY --from=build /app/dist ./dist
COPY --from=build /app/.env.sample .env.sample

# Expose backend port
EXPOSE 5000

# Set environment
ENV NODE_ENV=production

# Start backend
CMD ["npm", "start"]
