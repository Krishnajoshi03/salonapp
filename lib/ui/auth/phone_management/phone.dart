import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/ui/auth/phone_management/signup_page.dart';
import 'package:salonapp/ui/auth/phone_management/verify.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
 static String verify="";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  var phone="";
  final _formKey =GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ima1.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countryController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextFormField(
                            onChanged: (value)
                            {
                              phone=value;
                            },
                            keyboardType: TextInputType.phone,

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone",
                            ),
                           validator:(phone)
                              {
                                if(phone?.length!=10)
                                 {
                                  return 'Phone Number must be 10 Digit';
                                  }
                                return null;
                                },
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {

                       if(_formKey.currentState!.validate())
                        {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '${countryController.text +phone}',
                              verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                      MyPhone.verify = verificationId;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Verify()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                          );
                        }
                       else
                         {
                           setState(() {
                             Text
                               ('Please enter the phone number in must be 1-0 digit');
                           });
                         }

                      // await FirebaseAuth.instance.verifyPhoneNumber(
                      //   phoneNumber: '${countryController.text +phone}',
                      //   verificationCompleted: (PhoneAuthCredential credential) {},
                      //   verificationFailed: (FirebaseAuthException e) {},
                      //   codeSent: (String verificationId, int? resendToken) {
                      //       MyPhone.verify = verificationId;
                      //       Navigator.push(context, MaterialPageRoute(
                      //           builder: (context) => Verify()));
                      //
                      //   },
                      //     codeAutoRetrievalTimeout: (String verificationId) {},


                    },
                    child: Text("Send the code")),
              ),
              SizedBox(height: 20,),

              // Row(
              //   children: [
              //     Text("Don't have Acoount ?",
              //     style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //     ),),
              //     TextButton(onPressed: (){
              //       Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
              //     }, child: Text('Sign Up',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 15.0,
              //           color: Colors.tealAccent,
              //         ))),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}