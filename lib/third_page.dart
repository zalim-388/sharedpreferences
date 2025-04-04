import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdPage extends StatefulWidget {
  final String Name;
  final String Address;
  final int phonenumber;
  final bool gender;

  const ThirdPage({
    super.key,
    required this.Name,
    required this.Address,
    required this.phonenumber,
    required this.gender,
  });

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late String _name;
  late String _address;
  late int _phoneNumber;
  late bool _gender;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = widget.Name;
    _address = widget.Address;
    _phoneNumber = widget.phonenumber;
    _gender = widget.gender;
  }

  Future<void> setData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', namecontroller.text);
    await prefs.setString('Address', addresscontroller.text);
    await prefs.setInt('phonenumber', int.tryParse(phonecontroller.text) ?? 0);
    await prefs.setBool('Gender', _gender);
  }
Future<void> removeData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);

  setState(() {
    if (key == 'name') {
      _name = '';
      namecontroller.clear();
    }
    if (key == 'address') { 
      _address = '';
      addresscontroller.clear();
    }
    if (key == 'phonenumber') {
      _phoneNumber = 0;
      phonecontroller.clear();
    }
    if (key == 'gender') {
      _gender = false;
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Name: $_name", style: TextStyle(fontSize: 20)),
                Spacer(),
                IconButton(
                  onPressed: () => removeData("name"),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Address: $_address", style: TextStyle(fontSize: 20)),
                Spacer(),
                IconButton(
                  onPressed: () => removeData("Address"),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Phonenumber: $_phoneNumber",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => removeData("phonenumber"),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            Row(
              children: [
                Text(
              "Gender: ${_gender ? "Male" : "Female"}",
                  style: const TextStyle(fontSize: 20),
                ),
                Spacer(),
                IconButton(
                  onPressed: () => removeData("Gender"),
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
