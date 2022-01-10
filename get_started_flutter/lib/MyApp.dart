import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  String name;
  int age;
  MyApp(this.name, this.age);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late String _email = '';
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "${widget.name}, ${widget.age}",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _email = text;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: "Enter your email"),
                ),
              ),
              Text(_email,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
              const Text("line 2",
                  style: TextStyle(fontSize: 30, color: Colors.blue)),
              const Text("line 3",
                  style: const TextStyle(fontSize: 30, color: Colors.green)),
              ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    this.setState(() {
                      _email = '';
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
