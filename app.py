import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    # Knative can pass environment variables to your code
    target = os.environ.get('TARGET', 'Serverless Enthusiast')
    return f"Hello, {target}! I'm running on OpenShift Serverless.\n"

if __name__ == "__main__":
    # Knative standard is to listen on port 8080
    port = int(os.environ.get('PORT', 8080))
    app.run(debug=True, host='0.0.0.0', port=port)