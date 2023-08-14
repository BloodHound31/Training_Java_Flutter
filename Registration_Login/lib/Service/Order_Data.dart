import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:resgistration_login/Entity/BillingAddress.dart';
import 'package:resgistration_login/Entity/ProductDetails.dart';

class OrderData{

  late int id;
  late String customerName;
  late int productQuantity;
  late double totalMrp;
  late double totalDiscount;
  late double payAmount;
  late String orderStatus;
  late BillingAddress billingAddress;
  late List<ProductDetails> productList;


  OrderData({required this.id, required this.customerName, required this.productQuantity,required this.totalMrp, required this.totalDiscount, required this.payAmount, required this.orderStatus, required this.billingAddress, required this.productList});



 static void ShowToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static Future<void> AddBill(String userName ,double totalMrp, double totalDiscount, double payAmount) async {
    final apiUrl = 'http://10.0.2.2:8080/UserDetails/${userName}/Bill';

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
      },
          body: jsonEncode({
            'totalMrp': totalMrp,
            'totalDiscount': totalDiscount,
            'payAmount': payAmount,
          }));

      //String message = response.body;
      if (response.statusCode == 200) {
        ShowToast('Your order was successful');
      } else {

        ShowToast('Something wnt wrong');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


}//class

