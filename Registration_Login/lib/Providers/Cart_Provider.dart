import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Service/product_data.dart';

class CartItems{

  final ProductData product;
  final String productName;
  final double productPrice;
  final int productQuantity;

  CartItems(
      {required this.product,
        required this.productName,
        required this.productPrice,
        required this.productQuantity});

}

class CartItemProvider with ChangeNotifier{

  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items => _items;

  void addItems({required ProductData product, productPrice}){
    final productName = product.productName;
    if(_items.containsKey(productName)){
      _items.update(productName, (value) => CartItems(product: value.product,productName: value.productName, productPrice: value.productPrice, productQuantity: value.productQuantity+1));
      notifyListeners();
    }else{
      _items.putIfAbsent(productName, () => CartItems(product: product, productName: productName, productPrice: productPrice, productQuantity: 1));
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
    notifyListeners();
  }


  //required String productName,
  void subtractItems({required ProductData product, price}){
    final productName = product.productName;
    if(_items.containsKey(productName) && _items[productName]!.productQuantity >= 2){
      _items.update(productName, (value) => CartItems(product: value.product,productName: value.productName, productPrice: value.productPrice, productQuantity: value.productQuantity-1));
      notifyListeners();
    }else{
      _items.remove(productName);
      notifyListeners();
    }
  }


}