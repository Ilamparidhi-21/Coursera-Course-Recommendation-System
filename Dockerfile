# Use lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install system dependencies (optional but safe for some libs)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose Streamlit default port
EXPOSE 8501

# Run Streamlit app
CMD ["streamlit", "run", "main.py", "--server.address=0.0.0.0", "--server.port=8501"]
