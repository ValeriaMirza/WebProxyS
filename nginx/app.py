from flask import Flask, jsonify, request
import requests
import random

app = Flask(__name__)

# URLs of the existing web services
web_service_urls = [
    "https://webproxys-3.onrender.com",
    "https://webproxys-4.onrender.com"
]

@app.route('/')
def load_balance():
    # Select one of the web service URLs randomly
    target_url = random.choice(web_service_urls)
    
    # Forward the request to the selected web service
    response = requests.get(target_url)
    
    # Return the response from the web service back to the client
    return jsonify(response.json())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
