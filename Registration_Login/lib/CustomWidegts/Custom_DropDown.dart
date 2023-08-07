import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  final void Function(String? value) onSaved;
  final List<String> productList;
  const DropdownButtonExample(
      {required this.onSaved, required this.productList, Key? key})
      : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropDownValue = '';

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.productList.first;
    // Initialize the local dropdownValue with the value from widget
  }

  @override
  Widget build(BuildContext context) {
    //dropDownValue = widget.list.first;
    return DropdownButton<String>(
      hint: Text('Select Order'),
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 14,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      dropdownColor: Colors.blue,
      onChanged: (value) {
        dropDownValue = value!;
        setState(() {
          widget.onSaved(value);
        });
      },
      items: widget.productList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//const List<int> listTotalProduct = <int>[1,2,3,4,5,6,7,8,9,10,11,12];

class DropDownButtonPage extends StatefulWidget {
  final void Function(int? value) onChange;
  final List<int> listTotalProduct;
  const DropDownButtonPage(
      {required this.onChange, required this.listTotalProduct, Key? key})
      : super(key: key);

  @override
  State<DropDownButtonPage> createState() => _DropDownButtonPageState();
}

class _DropDownButtonPageState extends State<DropDownButtonPage> {
  int? dropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.listTotalProduct.isNotEmpty) {
      dropDownValue = widget.listTotalProduct.last;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      hint: Text(
        'Select No.Products',
        style: TextStyle(color: Colors.white),
      ),
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 14,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      dropdownColor: Colors.blue,
      onChanged: (value) {
        dropDownValue = value;
        setState(() {
          widget.onChange(value);
        });
      },
      items: widget.listTotalProduct.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}


class PaymentDropDown extends StatefulWidget {
  final void Function(String? value) onSaved;
  final List<String> paymentList;
  final String? dropDownValue;
  final void Function(String? value) onDropDownChanged;

  const PaymentDropDown(
      {required this.onSaved, required this.paymentList, Key? key, required this.dropDownValue, required this.onDropDownChanged})
      : super(key: key);

  @override
  State<PaymentDropDown> createState() => _PaymentDropDownState();
}

class _PaymentDropDownState extends State<PaymentDropDown> {


  // @override
  // void initState() {
  //   super.initState();
  //   widget.dropDownValue;
  //   // Initialize the local dropdownValue with the value from widget
  // }

  @override
  Widget build(BuildContext context) {
    //dropDownValue = widget.list.first;
    return DropdownButton<String>(
      hint: Text('Select Order'),
      value: widget.dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 14,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      dropdownColor: Colors.blue,
      onChanged: (value) {
        setState(() {
          widget.onSaved(value);
          widget.onDropDownChanged(value);
        });
      },
      items: widget.paymentList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


