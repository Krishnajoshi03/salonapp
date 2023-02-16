import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salonapp/ui/auth/phone_management/phone.dart';
import 'package:salonapp/ui/auth/phone_management/verify.dart';
import 'package:salonapp/ui/auth/splash_page.dart';
import 'package:salonapp/ui/home.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      initialRoute:'/',
      routes: {
        '/': (context) =>  SplashScreen(),
        '/phone': (context) => MyPhone(),
        '/verify': (context) => Verify(),
        '/home': (context)=> home(),
      }

    //home: SalonApp(),

  ));
}
class SalonApp extends StatefulWidget {
  @override
  State<SalonApp> createState() => _SalonAppState();
}

class _SalonAppState extends State<SalonApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  //const SalonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon app',
      home: SplashScreen(),
    );
  }
}
