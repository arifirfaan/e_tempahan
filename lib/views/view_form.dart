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

  String labelName = "";

  /// Fungsi untuk gantikan nama dari nilai TextField
  void onSubmit() {
    setState(() {
      labelName = _controllerName.text;
      _controllerName.clear();
    });
  }

  @override
  void dispose() {
    _controllerName.dispose();
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
            Container(
              height: 400,
              width: 300,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              color: Colors.cyan[50],
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Name"
                    ),
                    controller: _controllerName,
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
