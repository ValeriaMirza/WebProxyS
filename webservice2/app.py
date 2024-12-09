from flask import Flask, jsonify, request, render_template_string

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def hello():
    if request.method == 'POST':
        user_input = request.form['user_input']
        return jsonify({"message": f"The message you entered is : {user_input}"})
    
    return render_template_string("""
        <form method="POST">
            <label for="user_input">Enter your message</label>
            <input type="text" id="user_input" name="user_input">
            <button type="submit">Submit</button>
        </form>
    """)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
