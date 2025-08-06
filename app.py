from flask import Flask, render_template, request, redirect, url_for, flash
from pymongo import MongoClient
from dotenv import load_dotenv
import os

load_dotenv()  # Load variables from .env

app = Flask(__name__, static_folder='static', template_folder="templates")
app.secret_key = "your_secret_key"  # Needed for flashing messages

# MongoDB connection
mongo_uri = os.getenv("MONGO_URI", "mongodb://localhost:27017/")
client = MongoClient(mongo_uri)
db = client["portfolio_db"]
messages = db["messages"]

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/contact", methods=["POST"])
def contact():
    name = request.form.get("name")
    email = request.form.get("email")
    message = request.form.get("message")
    if name and email and message:
        messages.insert_one({"name": name, "email": email, "message": message})
        flash("Thank you! Your message has been sent.", "success")
    return redirect(url_for("home"))

if __name__ == "__main__":
    app.run(debug=True)