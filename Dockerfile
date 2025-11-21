# Dockerfile
FROM python:3.12-slim

# Create app directory
WORKDIR /app

# Copy code
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Create config and logs directories
RUN mkdir -p /config /logs

# Use non-root user
RUN useradd -m unifi2netbox
USER unifi2netbox

ENV PYTHONUNBUFFERED=1

# Default command
ENTRYPOINT ["python", "main.py", "--config", "/config/config.yaml"]
