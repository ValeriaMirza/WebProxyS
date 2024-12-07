# Dockerfile for WebService1
FROM python:3.9-slim

WORKDIR /app

COPY webservice1/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY webservice1 /app/

EXPOSE 5001

CMD ["python", "app.py"]
