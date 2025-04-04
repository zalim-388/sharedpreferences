import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _name = "";
  String _address = "";
  int _phoneNumber = 0;
  bool _gender = false;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString("name") ?? "Not Set";
      _address = prefs.getString("Address") ?? "Not Set";
      _phoneNumber = prefs.getInt("phonenumber") ?? 0;
      _gender = prefs.getBool("Gender") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 120),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: $_name", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Address: $_address", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text(
                    "Phone number: $_phoneNumber",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text("Gender: ${_gender ? "Male" : "Female"}"),
                ],
              ),
            ),
            SizedBox(height: 420),
            FloatingActionButton(
              child: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ThirdPage(
                          Name: _name,
                          Address: _address,
                          phonenumber: _phoneNumber,
                          gender: _gender,
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
