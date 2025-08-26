FROM python:3.12-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg \
    wget \
    bash \
    neofetch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# Install python dependencies
RUN pip install --no-cache-dir -U -r requirements.txt

COPY . .

EXPOSE 5000

# Command to run the application
CMD ["python3", "main.py"]
