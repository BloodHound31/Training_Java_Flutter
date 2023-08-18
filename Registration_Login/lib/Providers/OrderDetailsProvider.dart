
import 'package:flutter/cupertino.dart';
import 'package:resgistration_login/Entity/BillingAddress.dart';

import '../Entity/ProductDetails.dart';

class OrderDetailsProvider with ChangeNotifier{

  List<ProductDetails> _productSummary = [];
  late BillingAddress _billingAddress;
  bool _showWidget = false;

  List<ProductDetails> get productSummary => _productSummary;


  BillingAddress get billingAddress => _billingAddress;
  bool get showWidget => _showWidget;



OrderDetailsProvider(){
  PayAmount();
}


  void IntializeValue(List<ProductDetails> initialPD){

    _productSummary = initialPD;

    notifyListeners();

  }

  int totalPrice(int productPrice, int productQuantity){
    int totalPrice = productPrice * productQuantity;
    return totalPrice;
  }



  void decreaseProduct(int index){
    if(_productSummary.isNotEmpty && index >= 0 && index < _productSummary.length) {
     if(_productSummary[index].productQuantity > 0){
       _productSummary[index].productQuantity--;
       _productSummary[index].totalProductPrice = totalPrice(_productSummary[index].productPrice, _productSummary[index].productQuantity);
     }
      notifyListeners();
    }
  }




  void increaseProduct(int index){

    if(_productSummary.isNotEmpty && index >= 0 && index < _productSummary.length) {
      if(_productSummary[index].productQuantity < _productSummary[index].initialQuantity){
        _productSummary[index].productQuantity++;
        _productSummary[index].totalProductPrice = totalPrice(_productSummary[index].productPrice, _productSummary[index].productQuantity);
      }
    }
    notifyListeners();

  }
  //
  void goToDefault(int index){
    if(_productSummary.isNotEmpty) {
      _productSummary[index].productQuantity = _productSummary[index].initialQuantity;
      _productSummary[index].totalProductPrice = _productSummary[index].initialTotal;
    }
    notifyListeners();
  }

  void updateSummary(int index){
    if(_productSummary.isNotEmpty) {
      _productSummary[index].initialQuantity = _productSummary[index].productQuantity;
      _productSummary[index].initialTotal = _productSummary[index].totalProductPrice;
    }
    notifyListeners();
  }

  void toggleWidget(){
    _showWidget = !_showWidget;
    notifyListeners();
  }

  int PayAmount(){

    int payAmount = 0;
    _productSummary.forEach((element) {
      payAmount += element.totalProductPrice;
    });
    return payAmount;

  }

}