FROM python:3.12-alpine3.18

# Set working directory inside the container
WORKDIR /application

# Copy requirements file first (for better Docker caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
# This includes app.py, templates/, static/, etc.
COPY . .

# Expose the Flask port
EXPOSE 5000

# Run the Flask application
CMD ["python3", "app.py"]
