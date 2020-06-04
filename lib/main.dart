import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './screens/detail_screen.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      routes: {
        DetailScreen.routeName: (ctx) => DetailScreen(),
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data = [];

  Future<String> getData() async {
    var response = await http.get(Uri.encodeFull("http://10.0.2.2:5000/"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[0]["email"]);
    return "success";
  }

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  void showStudent(ctx, i) {
    Navigator.of(ctx).pushNamed(DetailScreen.routeName, arguments: {
      "firstName": data[i]["first_name"].toString(),
      "lastName": data[i]["last_name"].toString(),
      "rollNumber": data[i]["roll_no"].toString(),
      "email": data[i]["email"].toString(),
      "phoneNumber": data[i]["phone_number"].toString()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text('StudentsDB'),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.length == 0 ? 0 : data.length,
          itemBuilder: (ctx, i) => Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => showStudent(context, i),
                child: Card(
                  color: Colors.grey[400],
                  child: ListTile(
                    title: Text(
                      "${data[i]["first_name"]} ${data[i]["last_name"]}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    subtitle: Text(
                      "${data[i]["roll_no"]}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/image/user.jpeg"),
                    ),
                  ),
                ),
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
