# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install system dependencies (required for some Python packages)
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose port
EXPOSE 8000

# Run command (use uvicorn for development, gunicorn for production)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]