import 'package:flutter/material.dart';

import 'package:resgistration_login/Service/product_data.dart';

class ProductProvider with ChangeNotifier{


  List<ProductData> _productList = [];
  List<ProductData> _productFound = [];
  int _productsToShow = 12;

  List<ProductData> get productList => _productList;
  List<ProductData> get productFound => _productFound;
  int get productsToShow => _productsToShow;



  ProductProvider(){
    _getProducts();
  }

  Future<void> _getProducts() async{
    await ProductData.fetchProducts();
    _productList = ProductData.products;
    _productFound = productList;
    notifyListeners();
  }

  void onSortOrderChanged(String? value) {

    if (value == 'A-Z') {
      _productFound.sort((a, b) => a.productName.compareTo(b.productName));
    } else if (value == 'Z-A') {
      _productFound.sort((a, b) => b.productName.compareTo(a.productName));
    }
    notifyListeners();
  }


  //Search Products
  void SearchProduct(String enteredKeyword) {
    List<ProductData> result = [];
    if (enteredKeyword.isEmpty) {
      result = productList;
    } else {
      result = productList
          .where((element) =>
      element.productName
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()) ||
          element.productCategories
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    _productFound = result;
    notifyListeners();
  }


  void changePage(int? enteredNumber) {
    _productsToShow = enteredNumber!;
    notifyListeners();
  }

  void ChangeAvailableStocks(String productName, int availableStocks){
    ProductData.changeAvailableProducts(productName, availableStocks);
    notifyListeners();
  }


}
