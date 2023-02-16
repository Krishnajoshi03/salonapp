import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class OwnerInfo extends StatefulWidget {
  const OwnerInfo({Key? key}) : super(key: key);

  @override
  State<OwnerInfo> createState() => _OwnerInfoState();
}

class _OwnerInfoState extends State<OwnerInfo> {
  final databaseref =FirebaseDatabase.instance.ref('Owner');
  final nameController =TextEditingController();
  final shopnameController =TextEditingController();
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner info'),
      ),
      body: Column(
        children: [
          SizedBox(height:30,),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )

            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
            controller: shopnameController,
            decoration: InputDecoration(
              hintText: 'shop name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )

            ),
          ),

          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            databaseref.child(auth.currentUser!.phoneNumber.toString()).set({
              'Name':nameController.text.toString(),
              'Shop Name' :shopnameController.text.toString(),
            });
          },
              child: Text('add data')),
        ],
      ),
    );

  }
}
