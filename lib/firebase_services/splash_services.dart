

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonapp/ui/auth/login_page.dart';
import 'package:salonapp/ui/home.dart';

import '../ui/auth/phone_management/phone.dart';



class  SplashService {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null ) {
      Timer(Duration(seconds: 3), () =>
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => home()),(route) => false));
    }
    else{
      Timer(Duration(seconds: 3), () =>
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyPhone()), (route) => false));
    }
  }
}