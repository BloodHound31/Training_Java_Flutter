import 'package:flutter/material.dart';
import 'package:resgistration_login/Service/product_data.dart';

class CartItems{

  final ProductData product;
  final String productName;
  final double productPrice;
  final double discountPercent;
  final int productQuantity;

  CartItems(
      {required this.product,
        required this.productName,
        required this.productPrice,
        required this.discountPercent,
        required this.productQuantity});

}

class CartItemProvider with ChangeNotifier{

  final Map<String, CartItems> _items = {};

  Map<String, CartItems> get items => _items;

  void addItems({required ProductData product, productPrice, discountPercent}){
    final productName = product.productName;
    if(_items.containsKey(productName)){
      _items.update(productName, (value) => CartItems(product: value.product,productName: value.productName, productPrice: value.productPrice, discountPercent: value.discountPercent, productQuantity: value.productQuantity+1));
      notifyListeners();
    }else{
      _items.putIfAbsent(productName, () => CartItems(product: product, productName: productName, productPrice: productPrice, discountPercent: discountPercent, productQuantity: 1));
      notifyListeners();
    }
  }

  //Get the total price
  double get TotalPrice{
    double totalPrice = 0.0;
    _items.forEach((key, value) {
      totalPrice += value.productPrice * value.productQuantity;
    });

    return totalPrice;
  }

  //Get the total price
  double get totalDiscount{
    double totalDiscount = 0.0;
    _items.forEach((key, value) {
      totalDiscount += value.discountPercent;
    });

    return totalDiscount;
  }


  //required String productName,
  void subtractItems({required ProductData product, price, discountPercent}){
    final productName = product.productName;
    if(_items.containsKey(productName) && _items[productName]!.productQuantity >= 2){
      _items.update(productName, (value) => CartItems(product: value.product,productName: value.productName, productPrice: value.productPrice, discountPercent: value.discountPercent, productQuantity: value.productQuantity-1));
      notifyListeners();
    }else{
      _items.remove(productName);
      notifyListeners();
    }
  }

  void clearCart(){
    _items.clear();
    notifyListeners();
  }





}