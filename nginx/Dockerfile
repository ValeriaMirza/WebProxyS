FROM python:3.9-slim

WORKDIR /app
COPY nginx/requirements.txt . 
RUN pip install -r mginx/requirements.txt
COPY . . 

CMD ["python", "nginx/app.py"]
