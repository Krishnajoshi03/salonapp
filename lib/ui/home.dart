import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/ui/auth/phone_management/phone.dart';
import 'package:salonapp/ui/auth/selection/customerinfo.dart';
import 'package:salonapp/ui/auth/selection/ownerinfo.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final auth =FirebaseAuth.instance;
  final databaseref  =FirebaseDatabase.instance.ref('Owner');
  final customerref = FirebaseDatabase.instance.ref('Customer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('home'),
        actions: [
          IconButton(onPressed: () {
            auth.signOut().then((value) {
              // Navigator.push(context,MaterialPageRoute(builder: (context)=>MyPhone()));
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyPhone()), (route) => false);
            });
          },
              icon:Icon(Icons.logout_outlined) )
        ],
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.tealAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )

                ),
                  onPressed: () {
                  print(auth.currentUser!.phoneNumber.toString());
                 databaseref.child(auth.currentUser!.phoneNumber.toString()).set({
                   'Status'  : 'Owner'
                 });
                 print(databaseref.ref);

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>OwnerInfo()));
                  },
                  child: Text('Owner',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1.5
                  ),)),
              SizedBox(height: 30,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )

                  ),
                  onPressed: () {
                    customerref.child(auth.currentUser!.phoneNumber.toString()).set({
                      "Status" :'Customer',
                    });
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CustomerInfo() ));

                  },
                  child: Text('Customer',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.black
                  ),)),
            ],

          ),
        ),
      ),
    );
  }
}
