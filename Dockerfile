# Use the official Python image to build the Flask web services
FROM python:3.9-slim as webservice-build

# Set up the first web service
WORKDIR /app/webservice1
COPY ./webservice1/requirements.txt .
RUN pip install -r requirements.txt
COPY ./webservice1 /app/webservice1

# Set up the second web service
WORKDIR /app/webservice2
COPY ./webservice2/requirements.txt .
RUN pip install -r requirements.txt
COPY ./webservice2 /app/webservice2

# Set up Nginx
FROM nginx:latest as nginx-build

# Copy the Nginx configuration file
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 80

# Final stage: run both web services and Nginx
FROM python:3.9-slim

# Install Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Copy web services and Nginx from the previous build stages
COPY --from=webservice-build /app/webservice1 /app/webservice1
COPY --from=webservice-build /app/webservice2 /app/webservice2
COPY --from=nginx-build /etc/nginx/nginx.conf /etc/nginx/nginx.conf

# Expose the ports for both web services
EXPOSE 5001 5002

# Start both Flask web services and Nginx using supervisor (to manage multiple processes)
RUN apt-get update && apt-get install -y supervisor

# Create a supervisor configuration to run both web services and Nginx
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
