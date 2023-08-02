//import 'package:flutter/material.dart';
import'package:http/http.dart' as http;
import'dart:convert';



class UserData{
  String userName="";
  String emailId="";
  String password="";
  String details="";
  String url = "";




  Future<void> login(String email, String password) async {
    final apiUrl = 'http://10.0.2.2:8080/Login';

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
      },
          body: jsonEncode({
            'emailId': email,
            'password': password,
          }));

      if (response.statusCode == 200) {
        String message = response.body;
        print('Success: $message');

      } else {
        // Other error occurred or invalid credentials
        String errorMessage = response.body;
        print('Error : $errorMessage');

      }
    } catch (e) {
      print('Error: $e');
    }
  }//Login

  Future<void> Register(String userName, String email, String password, String details) async {

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

      if (response.statusCode == 200) {
        String message = response.body;
        print('Success: $message');
      } else {
        String errorMessage = response.body;
        print('error: $errorMessage');
      }
    } catch (e) {
      print('Error: $e');

    }
  }//Register




}