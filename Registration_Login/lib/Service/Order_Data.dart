import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderData{

  late double totalMrp;
  late double totalDiscount;
  late double payAmount;


  // OrderData({required this.totalMrp, required this.totalDiscount, required this.payAmount});
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'totalMrp': totalMrp,
  //     'totalDiscount': totalDiscount,
  //     'payAmount': payAmount,
  //   };
  // }



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

