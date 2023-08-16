import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Pages/Cart_Items.dart';
import 'package:resgistration_login/Pages/CheckOut_Page.dart';
import 'package:resgistration_login/Pages/OrderDetails.dart';
import 'package:resgistration_login/Pages/OrderList.dart';
import 'package:resgistration_login/Pages/ProductList.dart';
import 'package:resgistration_login/Pages/after_login.dart';
import 'package:resgistration_login/Pages/forgot_password.dart';
import 'package:resgistration_login/Pages/home.dart';
import 'package:resgistration_login/Pages/login.dart';
import 'package:resgistration_login/Pages/register.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';
//import 'package:resgistration_login/Providers/Order_Provider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => CartItemProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => ProductProvider()),
      //ChangeNotifierProvider(create: (BuildContext context) => OrderProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/OrderList',
      routes: {
        '/OrderList': (context) => OrderList(),
        '/ProductList': (context) => ProductList(),
        '/Home': (context) => Home(),
        '/Register':(context)=>Registration(),
        '/Login':(context)=>Login(),
        '/AfterLogin':(context)=>AfterLogin(),
        '/ForgotPassword':(context)=>ForgotPassword(),
        '/YourCart':(context)=>CartItemsPage(),
        '/Checkout':(context)=>CheckOutPage(),
        '/OrderDetails':(context)=>OrderDetails(),
      },
    ),
  ));
}


