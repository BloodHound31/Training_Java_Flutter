import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductData {
  late String productName;
  late String productDiscription;
  late double productPrice;
  late double sellerDiscount;
  late double finalPrice;
  late String sellerName;
  late String productCategories;
  late int availableStock;
  int stocks;

  static List<ProductData> products = [];

  ProductData(
      {required this.productName,
      required this.productPrice,
      required this.sellerDiscount,
      required this.sellerName,
      required this.productDiscription,
        required this.stocks,
      required this.productCategories,
      required this.availableStock}){
    stocks = availableStock;
    finalPrice = calculateFinalPrice(productPrice, sellerDiscount);
  }

  double calculateFinalPrice(double productPrice, double discountPercentage) {
    double discountAmount = productPrice * (discountPercentage / 100);
    double finalPrice = productPrice - discountAmount;
    return finalPrice;
  }

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
        productName: json['productName'] ?? 'NuLL',
        productPrice: json['productPrice'] as double ?? 0.0,
        sellerDiscount: json['sellerDiscount'] as double ?? 0.0,
        sellerName: json['sellerName'] ?? 'Null',
        productDiscription: json['productDiscription'] ?? 'Null',
        productCategories: json['productCategories'] ?? 'Null',
        availableStock: json['productDetails']['availableStock'] as int ?? 0,
        stocks: json['productDetails']['availableStock'] as int ?? 0,
    );
  }

  static Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/Products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      products = data.map((item) => ProductData.fromJson(item)).toList();
      products.sort((a, b) => a.productName.compareTo(b.productName));
    } else {
      print('not found');
    }
  }


  void IncreaseStocks(){
    if(availableStock < stocks) {
      availableStock += 1;
    }
  }

  void DecreaseStocks(){
    if(availableStock > 0){
      availableStock -= 1;
    }
  }
}
