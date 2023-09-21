import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageTest extends StatefulWidget {
  const StorageTest({super.key});

  @override
  State<StorageTest> createState() => _StorageTestState();
}

class _StorageTestState extends State<StorageTest> {
  String _stringTest = "100";
  late Future<int> testInt;
  late int _testInt = 69;

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _stringTest = prefs.getString("test")!;
      _testInt = prefs.getInt('testInt')!;
    });
  }

  Future<void> UpdateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('testInt', _testInt);
    prefs.setString("test", _stringTest);
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage Test"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "$_testInt",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 300,
          ),
          Text(
            _stringTest,
            style: TextStyle(fontSize: 33),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _stringTest = "working2";
                _testInt = Random().nextInt(100);
                UpdateData();
              });
            },
            child: Text("Click Me"),
          )
        ],
      )),
    );
  }
}
