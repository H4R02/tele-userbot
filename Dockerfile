FROM python:3.12-slim

# Install essential system dependencies
# Removed neofetch as it's not available in the slim image's default repositories and was causing the error.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    wget \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# Install python dependencies
RUN pip install --no-cache-dir -U -r requirements.txt

COPY . .

EXPOSE 5000

# This command will be overridden by your Procfile on Render
CMD ["python3", "main.py"]
