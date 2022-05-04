from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<h1><p style='font-family:monospace'>Checkout <a href='https://github.com/x0rzavi/heroku-vpn'>heroku-vpn</a> on Github by <a href='https://github.com/x0rzavi'>X0rzAvi</a></p></h1>"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
