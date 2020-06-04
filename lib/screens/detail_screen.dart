import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String firstName;
  String lastName;
  String rollNumber;
  String email;
  String phoneNumber;
  static const routeName = '/details';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    firstName = routeArgs["firstName"];
    lastName = routeArgs["lastName"];
    rollNumber = routeArgs["rollNumber"];
    email = routeArgs["email"];
    phoneNumber = routeArgs["phoneNumber"];

    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text(firstName),
          backgroundColor: Colors.grey[850],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/user.jpeg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[800],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Name:',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '$firstName $lastName',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Roll No:',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    rollNumber,
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Email:',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Mobile No:',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
