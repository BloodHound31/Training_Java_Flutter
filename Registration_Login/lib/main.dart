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
import 'package:resgistration_login/Providers/BankProvider.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';
import 'package:resgistration_login/Providers/DropdownChangeProvider.dart';
import 'package:resgistration_login/Providers/OrderDetailsProvider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';

import 'Providers/Order_Provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => CartItemProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => ProductProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => OrderProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => OrderDetailsProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => DropdownChangeProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => BankProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/ProductList',
      routes: {
        '/OrderList': (context) => const OrderList(),
        '/ProductList': (context) => const ProductList(),
        '/Home': (context) => const Home(),
        '/Register':(context)=>const Registration(),
        '/Login':(context)=>const Login(),
        '/AfterLogin':(context)=>const AfterLogin(),
        '/ForgotPassword':(context)=>const ForgotPassword(),
        '/YourCart':(context)=>const CartItemsPage(),
        '/Checkout':(context)=>const CheckOutPage(),
        '/OrderDetails':(context)=>const OrderDetails(),
      },
    ),
  ));
}


