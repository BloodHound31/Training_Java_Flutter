import 'package:flutter/material.dart';

import 'package:resgistration_login/Service/product_data.dart';

class ProductProvider with ChangeNotifier{


  List<ProductData> _productList = [];
  List<ProductData> _productFound = [];
  int _productsToShow = 12;
  // late int _availableStocks;
  List<ProductData> _productsOnPage = [];

  List<ProductData> get productList => _productList;
  List<ProductData> get productFound => _productFound;
  List<ProductData> get productsOnPage => _productsOnPage;
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


  void increaseStocks(int index){
    if(_productFound[index].availableStock < _productFound[index].initialStocks) {
      _productFound[index].availableStock += 1;
    }
    notifyListeners();
  }

  void decreaseStocks(int index){
    if(_productFound[index].availableStock > 0){
      _productFound[index].availableStock -= 1;
    }
    notifyListeners();
  }

  void pageSorting(int index){
    final int startIndex = index * _productsToShow;
    final int endIndex =
    (startIndex + _productsToShow < productFound.length)
        ? startIndex + _productsToShow
        : _productFound.length;

    _productsOnPage =  productFound.sublist(startIndex, endIndex);


  }


}
