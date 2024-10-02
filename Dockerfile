# Use an official Python runtime as a base image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file if it exists (adjust this if you're using a virtual environment)
# If you don't have a requirements.txt, skip this step.
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Command to run your Python script (adjust as necessary)
CMD ["python", "test.py"]
