FROM python:3.10-slim

# Install Golang, Node.js, Git, and Bash
RUN apt-get update && apt-get install -y \
    golang-go \
    nodejs \
    npm \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 3000

CMD ["bash", "termux_start_server.sh"]
