import weasyprint

from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def hello():
    return "This is minimalistic HTML to PDF web-server"

@app.route('/pdf', methods=['POST'])
def pdf():
    return weasyprint.HTML(string=request.data).write_pdf()

if __name__ == "__main__":
    app.run(debug=True)
