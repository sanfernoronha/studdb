from studentmanager import db, Student

student_1 = Student(first_name='test', last_name='2', roll_no=1234,
                    email="test2@gmail.com", phone_number=9210938822)
db.session.add(student_1)
db.session.commit()
student_2 = Student(first_name='test', last_name='3', roll_no=8307,
                    email="test3@gmail.com", phone_number=9371671111)
db.session.add(student_2)
db.session.commit()
