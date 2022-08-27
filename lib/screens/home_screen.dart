import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var nameController = new TextEditingController();
  var addressController = new TextEditingController();

  final databaseRef = FirebaseDatabase. instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 241, 25),
        centerTitle: true,
        title: Text("Insert Your Data"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(height: 25,
            width: 20,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Name',border: OutlineInputBorder()),
            ),
            SizedBox(height: 25,
            width: 20,
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Enter Address',border: OutlineInputBorder()),
            ),
            SizedBox(height: 25,
            width: 20,
            ),
            OutlinedButton(onPressed: (){insertData(nameController.text, addressController.text);},
            child: Text("Insert"),)

          ]),
        ),
      ),
    );
  }
  void insertData(String name, String address){
    databaseRef.child("path").push().set({
      'name':name,
      'address':address,
    });
    nameController.clear();
    addressController.clear();
  }
}
