FROM python:3.12-alpine3.18

# Set working directory
WORKDIR /application

# Copy requirements first (to cache dependencies)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .
COPY templates/ ./templates/   # Flask HTML templates

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]
