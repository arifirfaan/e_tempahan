// 1. create variable controller for every Textfield Input
// 2. add widget TextField
// 3. add void dispose

import 'package:e_tempahan/model/permohonan_model.dart';
import 'package:flutter/material.dart';

class ViewForm extends StatefulWidget {
  const ViewForm({super.key});

  @override
  State<ViewForm> createState() => _ViewFormState();
}

class _ViewFormState extends State<ViewForm> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();

  final TextEditingController _controllerNoKP = TextEditingController();
  final TextEditingController _controllerAlamat = TextEditingController();

  String labelName = "";
  int labelPhone = 0;
  List<PermohonanModel> listpermohonan = [];

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
                      child: Text("Continue"))
                ],
              );
            });
      } else {
        labelPhone = int.parse(_controllerPhone.text);
        listpermohonan.add(PermohonanModel(
            nama: _controllerName.text, 
            noKP: int.parse(_controllerNoKP.text), 
            alamat: _controllerAlamat.text, 
            noPhone: int.parse(_controllerPhone.text))
        );
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
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter No KP"),
                    controller: _controllerNoKP,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Alamat"),
                    controller: _controllerAlamat,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: onSubmit, child: Text("Hantar/Submit")),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: 400,
              height: 200,
              child: ListView.builder(
                itemCount: listpermohonan.length,
                itemBuilder: (context, int index) {
                return Text(
                  listpermohonan[index].toString() + 
                  listpermohonan[index].nama +
                  listpermohonan[index].alamat
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
