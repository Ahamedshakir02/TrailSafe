# Build stage
FROM node:18-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy project files
COPY . .

# Expose port for Expo development server
EXPOSE 8081 19000 19001

# Default command - start Expo development server
CMD ["npm", "start"]
