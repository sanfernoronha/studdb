import os
from flask import Flask, request, jsonify, redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy_utils import PhoneNumber
import json
from flask_marshmallow import Marshmallow
from flask_migrate import Migrate


project_dir = os.path.dirname(os.path.abspath(__file__))
database_file = "sqlite:///{}".format(
    os.path.join(project_dir, "studentdatabase.db"))

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = database_file

db = SQLAlchemy(app)
ma = Marshmallow(app)
migrate = Migrate(app, db)


class Student(db.Model):
    first_name = db.Column(db.String(80), unique=False,
                           nullable=False, primary_key=False)
    last_name = db.Column(db.String(80), unique=False,
                          nullable=False, primary_key=False)
    roll_no = db.Column(db.Integer, unique=True,
                        nullable=False, primary_key=True)
    email = db.Column(db.String, unique=True,
                      nullable=False, primary_key=False)
    phone_number = db.Column(db.Unicode(
        255), unique=True, nullable=False, primary_key=False)

    def __repr__(self):
        return "<First Name: {}, Last Name: {}, Roll No. {}, Email: {}, Phone: {} >".format(self.first_name, self.last_name, self.roll_no, self.email, self.phone_number)


class StudentSchema(ma.Schema):
    class Meta:
        fields = ('first_name', 'last_name',
                  'roll_no', 'email', 'phone_number')


student_schema = StudentSchema(many=True)


@app.route('/', methods=["GET", "POST"])
def home():
    students = Student.query.all()
    result = student_schema.dump(students)
    print(result[0]['roll_no'])
    return jsonify(result)


@app.after_request
def add_headers(response):
    response.headers.add("Access-Control-Allow-Origin", "*")
    response.headers.add("Access-Control-Allow-Headers",
                         "Content-Type,Authorization")
    return response


if __name__ == "__main__":
    app.run(debug=False)
