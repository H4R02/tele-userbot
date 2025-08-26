FROM python:3.12-slim

# Install essential system dependencies and build tools
# Added build-essential and python3-dev to compile Python packages like tgcrypto.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    wget \
    bash \
    build-essential \
    python3-dev \
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
