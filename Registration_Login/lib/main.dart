import 'package:flutter/material.dart';
import 'package:resgistration_login/Pages/ListOrders.dart';
import 'package:resgistration_login/Pages/after_login.dart';
import 'package:resgistration_login/Pages/forgot_password.dart';
import 'package:resgistration_login/Pages/home.dart';
import 'package:resgistration_login/Pages/login.dart';
import 'package:resgistration_login/Pages/register.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/OrderList',
    routes: {
      '/OrderList': (context) => ListOrders(),
      '/Home': (context) => Home(),
      '/Register':(context)=>Registration(),
      '/Login':(context)=>Login(),
      '/AfterLogin':(context)=>AfterLogin(),
      '/ForgotPassword':(context)=>ForgotPassword()
    },
  ));
}


