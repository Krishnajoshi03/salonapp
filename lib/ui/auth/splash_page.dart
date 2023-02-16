import 'package:flutter/material.dart';
import 'package:salonapp/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService= SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.islogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('firebase tutorial',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}

