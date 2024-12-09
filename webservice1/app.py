from flask import Flask, jsonify, request, render_template_string

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def hello():
    if request.method == 'POST':
        username = request.form['user_input']
        password = request.form['password_input']
        
        # Here, you could add more sophisticated logic to check the password.
        if username and password:
            return jsonify({"message": f"You have successfully logged in, {username}!"})
        else:
            return jsonify({"message": "Login failed. Please provide both username and password."})

    return render_template_string("""
        <form method="POST">
            <label for="user_input">Username:</label>
            <input type="text" id="user_input" name="user_input" required>
            <label for="password_input">Password:</label>
            <input type="password" id="password_input" name="password_input" required>
            <button type="submit">Submit</button>
        </form>
    """)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
