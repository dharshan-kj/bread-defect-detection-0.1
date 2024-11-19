# Use the official Python image as a base
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install dependencies from the requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install OpenCV dependencies (for OpenGL)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port that the app will run on
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]
