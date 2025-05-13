# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies first for caching
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose port
EXPOSE 3000

# Run command
CMD ["npm", "run", "dev"]