import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  bool _selectedValue = false;
  @override
  void initState() {
    super.initState();
    setdata();
  }

  Future<void> setdata() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', namecontroller.text);
    await prefs.setString("Address", addresscontroller.text);
    await prefs.setInt('phonenumber', int.parse(phonecontroller.text));
    await prefs.setBool('Gender', _selectedValue);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add details",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 150),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: addresscontroller,
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phonecontroller,
                decoration: InputDecoration(
                  labelText: "phone number",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  Text(
                    "Gender",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  ListTile(
                    title: Text(
                      "male",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    leading: Radio(
                      value: true,
                      groupValue: _selectedValue,
                      onChanged: (bool? newvalue) {
                        setState(() {
                          _selectedValue = newvalue ?? false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Female",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    leading: Radio(
                      value: false,
                      groupValue: _selectedValue,
                      onChanged: (bool? newvalue) {
                        setState(() {
                          _selectedValue = newvalue ?? true;
                        });
                      },
                    ),
                  ),
                  // ListTile(
                  //   title: Text(
                  //     "other",
                  //     style: TextStyle(color: Colors.black, fontSize: 20),
                  //   ),
                  //   leading: Radio(
                  //     value: _selectedValue,
                  //   groupValue: _selectedValue,
                  //     onChanged: (bool? value) {
                  //       setState(() {
                  //         _selectedValue = value!;
                  //       });
                  //     },
                  //   ),
                  // )
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await setdata();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SecondPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "submit",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  // Future<void> submit() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("Name", namecontroller.text.trim());
  //   await prefs.setString("Address", addresscontroller.text.trim());
  //   await prefs.setString("phonenumber", phonecontroller.text.trim());
  //   await prefs.setBool("gender", _selectedValue);
  // }