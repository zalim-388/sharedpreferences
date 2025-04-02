import 'package:flutter/material.dart';
import 'package:sharedpreferences/third_page.dart';

class SecondPage extends StatefulWidget {
  final String Name;
  final String Address;
  final int phonenumber;
  const SecondPage({
    super.key,
    required this.Name,
    required this.Address,
    required this.phonenumber,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 120),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),

                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Text("Name:${widget.Name}", style: TextStyle(fontSize: 20)),

                  SizedBox(height: 10),
                  Text(
                    "Address:${widget.Address}",
                    style: TextStyle(fontSize: 20),
                  ),

                  SizedBox(height: 10),
                  Text(
                    "Phone number:${widget.phonenumber.toString()}",

                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 120),
            FloatingActionButton(
              child: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
