from flask import Flask, jsonify, request, render_template_string

app = Flask(__name__)

@app.route('/')
def hello():
    if request.method == 'POST':
        username = request.form['user_input']
        
        # Here, you could add more sophisticated logic to check the password.
        jsonify({"message": f"You have entered, {username}!"})
        

    return render_template_string("""
        <form method="POST">
            <label for="user_input">Enter your message:</label>
            <input type="text" id="user_input" name="user_input" required>
            
        </form>
    """)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
