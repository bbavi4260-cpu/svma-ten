# Use an official Python slim image as the base
FROM python:3.10-slim

# Install Golang, Git, and Bash
RUN apt-get update && apt-get install -y \
    golang-go \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy requirements and install Python dependencies if any exist
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project files
COPY . .

# Expose the port your server runs on (e.g., 3000)
EXPOSE 3000

# Run your start script when the container boots up
CMD ["bash", "termux_start_server.sh"]
