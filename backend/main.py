from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def root():
    return "hello from backendweb새새새"

@app.get("/healthz")
def health():
    return jsonify(status="ok", version=os.getenv("GIT_SHA", "dev"))

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8000"))
    app.run(host="0.0.0.0", port=port)
