import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import'package:http/http.dart' as http;
import'dart:convert';



class UserData{
  String userName="";
  String emailId="";
  String password="";
  String details="";
  String url = "";

  void ShowToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }




  Future<void> login(String email, String password, @required BuildContext context) async {
    final apiUrl = 'http://10.0.2.2:8080/Login';

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
      },
          body: jsonEncode({
            'emailId': email,
            'password': password,
          }));

      String message = response.body;
      if (response.statusCode == 200 && message.isNotEmpty && message != 'Credentials are not valid') {
          ShowToast(message);
          Navigator.pushNamed(context, '/AfterLogin');
      } else {
        ShowToast(message);
      }
    } catch (e) {
      print('Error: $e');
    }
  }//Login

  Future<void> Register(String userName, String email, String password, String details, @required BuildContext context) async {

    final apiUrl = 'http://10.0.2.2:8080/Register/';

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
      },
          body: jsonEncode({
            'userName': userName,
            'emailId': email,
            'password': password,
            'details': details,
          }));

      String message = response.body;
      if (response.statusCode == 200 && message == userName) {

        ShowToast(message);
        Navigator.pushNamed(context, '/Login');
      } else {
        String errorMessage = response.body;
        ShowToast(errorMessage);
      }
    } catch (e) {
      print('Error: $e');

    }
  }//Register


  Future<void> ChangePassword(String email, String oldPassword, String newPassword, @required BuildContext context) async {

    final apiUrl = 'http://10.0.2.2:8080/ChangePassword/';

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
          body: <String, String>{
            'email': email,
            'old': oldPassword,
            'new': newPassword,
          });

      String message = response.body;
      if (response.statusCode == 200 && message.isNotEmpty && message == 'password changed') {

        ShowToast(message);
        Navigator.pushNamed(context, '/Login');

      } else {
        ShowToast(message);
      }
    } catch (e) {
      print('Error: $e');

    }
  }//Change Password


  static Future<void> UserDetailsPost(String userName, String userAddress, String paymentOption) async{

    String url = 'http://10.0.2.2:8080/UserDetails';
    if(userName.isNotEmpty && userAddress.isNotEmpty && paymentOption.isNotEmpty){
      try{
        final response = await http.post(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'userName': userName,
              'userAddress': userAddress,
              'paymentOption': paymentOption,
            }));

        if (response.statusCode == 200) {
          // Print the response body
          print('Response Body: ${response.body}');
        } else {
          print('Request failed with status: ${response.statusCode}');
        }

      }catch(e){

        print('error: $e');
      }
    }else{
      print('fill details');
    }
  }


}