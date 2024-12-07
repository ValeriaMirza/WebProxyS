FROM python:3.9-slim

WORKDIR /app

# Copy the requirements.txt file from the webservice1 folder into the container
COPY nginx/requirements.txt ./nginx/requirements.txt

# Install dependencies from the copied requirements.txt
RUN pip install -r ./nginx/requirements.txt

# Copy the rest of your application code
COPY . .

# Set the command to run your application
CMD ["python", "./nginx/app.py"]
