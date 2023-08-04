import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import'package:http/http.dart' as http;
import'dart:convert';

class ProductData{

  late String productName;
  late String productDiscription;
  late double productPrice;
  late double sellerDiscount;
  late double finalPrice;
  late String sellerName;
  late String productCategories;

  ProductData({required this.productName, required this.productPrice, required this.sellerDiscount, required this.sellerName, required this.productDiscription, required this.productCategories}){
    finalPrice = calculateFinalPrice(productPrice, sellerDiscount);
  }

  double calculateFinalPrice(double productPrice, double discountPercentage) {
    double discountAmount = productPrice * (discountPercentage / 100);
    double finalPrice = productPrice - discountAmount;
    return finalPrice;
  }

  factory ProductData.fromJson(Map<String, dynamic> json){
    return ProductData(
      productName: json['productName'] ?? 'NuLL',
      productPrice: json['productPrice'] ?? 'Null' ,
      sellerDiscount: json['sellerDiscount'] ?? 'Null',
      sellerName: json['sellerName'] ?? 'Null',
      productDiscription: json['productDiscription'] ?? 'Null',
      productCategories: json['productCategories'] ?? 'Null',
    );
  }

  }



