# Stage 1: Build webservice1
FROM python:3.9-slim AS webservice1-build

WORKDIR /app/webservice1
COPY webservice1/requirements.txt .
RUN pip install -r requirements.txt
COPY webservice1 /app/webservice1

# Stage 2: Build webservice2
FROM python:3.9-slim AS webservice2-build

WORKDIR /app/webservice2
COPY webservice2/requirements.txt .
RUN pip install -r requirements.txt
COPY webservice2 /app/webservice2

# Stage 3: Build Nginx
FROM nginx:latest AS nginx-build

COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose all necessary ports
EXPOSE 5001 5002 80

# Final image
FROM nginx:latest

# Copy the webservice1 and webservice2 build artifacts
COPY --from=webservice1-build /app/webservice1 /app/webservice1
COPY --from=webservice2-build /app/webservice2 /app/webservice2
COPY --from=nginx-build /etc/nginx/nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 5001 5002 80

# Command to run services
CMD ["nginx", "-g", "daemon off;"]
