# Dockerfile for WebService2
FROM python:3.9-slim

WORKDIR /app

COPY webservice2/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY webservice2 /app/

EXPOSE 5002

CMD ["python", "app.py"]
