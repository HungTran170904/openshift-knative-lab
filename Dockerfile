# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
# Note: You need a requirements.txt file with 'flask' in it
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your specific python file
COPY serverless-function.py .

# Expose the port Knative expects
EXPOSE 8080

# Set environment variables (Knative will override these if needed)
ENV PORT=8080
ENV TARGET="K8s Master"

# Use the absolute path to run your specific filename
CMD ["python", "app.py"]