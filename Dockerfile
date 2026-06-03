FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy the application files
COPY setup.py .
COPY README.md .
COPY ycast/ ./ycast/

# Install Python dependencies
RUN pip install --no-cache-dir -e .

# Create a non-root user to run the application
RUN useradd -m -u 1000 ycast && chown -R ycast:ycast /app
USER ycast

# Expose port 80
EXPOSE 80

# Set default command
CMD ["python", "-m", "ycast", "-l", "0.0.0.0", "-p", "80"]
