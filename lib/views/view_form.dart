// 1. create variable controller for every Textfield Input
// 2. add widget TextField
// 3. add void dispose

import 'package:flutter/material.dart';

class ViewForm extends StatefulWidget {
  const ViewForm({super.key});

  @override
  State<ViewForm> createState() => _ViewFormState();
}

class _ViewFormState extends State<ViewForm> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  String labelName = "";
  int labelPhone = 0;

  /// Fungsi untuk gantikan nama dari nilai TextField
  void onSubmit() {
    setState(() {
      labelName = _controllerName.text;

      // check if user input alphabet in phone input
      if (RegExp(r'[a-zA-Z]').hasMatch(_controllerPhone.text)) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Wrong Input"),
                content: Text("Please input the correct number only."),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Continue")
                  )
                ],
              );
            });
      } else {
        labelPhone = int.parse(_controllerPhone.text);
      }

      _controllerName.clear();
      _controllerPhone.clear();
    });
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_pin),
            Text("Hello " + labelName),
            Text("Your phone number is $labelPhone"),
            Container(
              height: 400,
              width: 300,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              color: Colors.cyan[50],
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Name"),
                    controller: _controllerName,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Phone"),
                    controller: _controllerPhone,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: onSubmit, child: Text("Hantar/Submit")),
            )
          ],
        ),
      ),
    );
  }
}
