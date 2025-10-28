# ---------- Stage 1: Build ----------
FROM node:18-alpine AS builder
WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Install all dependencies including devDeps for build
RUN npm install --ignore-scripts

# Copy source files
COPY . .

# Build TypeScript to JavaScript
RUN npm run build


# ---------- Stage 2: Runtime ----------
FROM node:18-alpine AS runtime
WORKDIR /app

# Copy only production dependencies
COPY package*.json ./
# Install only production dependencies
RUN npm install --omit=dev --ignore-scripts && \
    npm cache clean --force && \
    rm -rf /tmp/* /root/.npm /usr/share/man /usr/share/doc

# Copy built files from builder
COPY --from=builder /app/dist ./dist
COPY .env.sample ./.env.sample

# Expose backend port
EXPOSE 8080

# Run the backend
#CMD ["npm", "start"]
# Run directly with Node
CMD ["node", "dist/server.js"]