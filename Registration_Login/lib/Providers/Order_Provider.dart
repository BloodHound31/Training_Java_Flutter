import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Entity/BillingAddress.dart';
import '../Entity/ProductDetails.dart';
import '../Service/Order_Data.dart';

class OrderProvider with ChangeNotifier{

  List<OrderData> _orderList = [
  OrderData(id: 1, totalMrp: 300, totalDiscount: 50, payAmount: 100, orderStatus: 'Pending', customerName: 'Customer A', productQuantity: 5,
  billingAddress: BillingAddress(buildingName: 'Show-13 Amar Building', streetName: 'Main Carter Road', townName: 'Borivali West', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400092),
  productList: [ProductDetails(productName: 'Bath Soap', productQuantity: 10, productPrice: 50), ProductDetails(productName: 'Detergent', productQuantity: 20, productPrice: 30)]),

  OrderData(id: 2, totalMrp: 500, totalDiscount: 100, payAmount: 400, orderStatus: 'Pending', customerName: 'Customer B', productQuantity: 10,
  billingAddress: BillingAddress(buildingName: 'Shop No.1 Sheetal Park', streetName: 'Sundar Nagar', townName: 'Borivali West', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400092),
  productList: [ProductDetails(productName: 'Maggie', productQuantity: 10, productPrice: 80), ProductDetails(productName: 'ToothBrush', productQuantity: 15, productPrice: 40)]),

  OrderData(id: 3, totalMrp: 500, totalDiscount: 100, payAmount: 400, orderStatus: 'PartialCancelled', customerName: 'Customer C', productQuantity: 10,
  billingAddress: BillingAddress(buildingName: 'Shop No. 37 Ajanta Square Mal', streetName: 'L.T Road', townName: 'Borivali West', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400092),
  productList: [ProductDetails(productName: 'Potato Chips', productQuantity: 40, productPrice: 20), ProductDetails(productName: 'Cheese', productQuantity: 20, productPrice: 15)]),

  OrderData(id: 4, totalMrp: 900, totalDiscount: 200, payAmount: 700, orderStatus: 'Full Cancel', customerName: 'Customer D', productQuantity: 10,
  billingAddress: BillingAddress(buildingName: 'Shop No.2, daya benkhat poul', streetName: 'Dattapada Rd', townName: 'Borivali East', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400066),
  productList: [ProductDetails(productName: 'Bread', productQuantity: 20, productPrice: 40), ProductDetails(productName: 'Cold Drink', productQuantity: 20, productPrice: 20)]),

  OrderData(id: 5, totalMrp: 1000, totalDiscount: 100, payAmount: 900, orderStatus: 'Delivered', customerName: 'Customer E', productQuantity: 5,
  billingAddress: BillingAddress(buildingName: ' Annapurna mart Shop no 2 Esspee tower ', streetName: 'Dattapada Rd', townName: 'Borivali East', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400066),
  productList: [ProductDetails(productName: 'Dairy Milk', productQuantity: 30, productPrice: 20), ProductDetails(productName: 'Oreo', productQuantity: 20, productPrice: 35)])
  ];

 // List<String> _statusList = ['All', 'Pending', 'Full Cancel', 'Delivered', 'PartialCancelled'];

  List<OrderData> _filteredList = [];

  String selectedStatus = 'All';



  List<OrderData> get orderList => _orderList;

  List<OrderData> get filteredList => _filteredList;


  void SearchProduct(String enteredKeyword) {
    List<OrderData> result = [];
    if (enteredKeyword.isEmpty) {
      result = _orderList;
    } else {
      result = _orderList
          .where((element) =>
          element.customerName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    _filteredList = result!;
    notifyListeners();
  }

  void sortByStatus(String? status) {
    selectedStatus = status!;
    if(status == 'All'){
      _filteredList = _orderList;
    }else{
      _filteredList = _orderList.where((item) => item.orderStatus == status).toList();
    }
    notifyListeners();
  }

  Color getStatusColorChange(String status){
    switch(status){
      case 'Pending':
        return Colors.red;
      case 'PartialCancelled':
        return Colors.yellow;
      case 'Full Cancel':
        return Colors.orange;
      case 'Delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget CustomStatus(int index){
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: getStatusColorChange(_orderList[index].orderStatus),
          radius: 7,
        ),
        SizedBox(width: 5,),
        Text('${_filteredList[index].orderStatus}')
      ],
    );
    notifyListeners();
  }







}//Class