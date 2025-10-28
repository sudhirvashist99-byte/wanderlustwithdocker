# ---------- Stage 1: Build ----------
FROM node:18-alpine AS builder
WORKDIR /app

# Copy dependency files
COPY package*.json ./
RUN npm install --ignore-scripts

# Copy app source
COPY . .

# pass build-time variable (optional)
ARG VITE_API_PATH
ENV VITE_API_PATH=${VITE_API_PATH}
# Build optimized production files
RUN npm run build


# ---------- Stage 2: Nginx Serve ----------
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Remove default nginx static files
RUN rm -rf ./*

# Copy build output from builder
COPY --from=builder /app/dist .

# Copy custom nginx config if needed
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
