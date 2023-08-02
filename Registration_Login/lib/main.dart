import 'package:flutter/material.dart';
import 'package:resgistration_login/Pages/home.dart';
import 'package:resgistration_login/Pages/login.dart';
import 'package:resgistration_login/Pages/register.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/Home',
    routes: {
      '/Home': (context) => Home(),
      '/Register':(context)=>Registration(),
      '/Login':(context)=>Login()
    },
  ));
}


