import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final customerref= FirebaseDatabase.instance.ref('Customer');
  final nameController =TextEditingController();
  final emailController =TextEditingController();
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer  info'),
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
            controller: emailController,
            decoration: InputDecoration(
                hintText: 'shop name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )

            ),
          ),

          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            customerref.child(auth.currentUser!.phoneNumber.toString()).set({
              'Name':nameController.text.toString(),
              'Shop Name' :emailController.text.toString(),
            });
          },
              child: Text('add data')),
        ],
      ),
    );
  }
}
