import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';

//For Order
class DropdownButtonExample extends StatefulWidget {
  final List<String> productList;
  const DropdownButtonExample(
      {required this.productList, Key? key})
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
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      //margin: EdgeInsets.symmetric(vertical: 5),
      //padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xFF8B9AD8),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text('A-Z'),
          value: dropDownValue,
          icon: const Icon(Icons.arrow_drop_down_outlined, size: 18, color: Color(0xFF293771)),
          elevation: 14,
          style: const TextStyle(color: Color(0xFF293771), fontSize: 14, fontWeight: FontWeight.bold),
          dropdownColor: Color(0xFF8B9AD8),
          onChanged: (value) {
            dropDownValue = value!;
            productProvider.onSortOrderChanged(value);
          },
          items: widget.productList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

//For Page
class DropDownButtonPage extends StatefulWidget {
  final List<int> listTotalProduct;
  const DropDownButtonPage(
      {required this.listTotalProduct, Key? key})
      : super(key: key);

  @override
  State<DropDownButtonPage> createState() => _DropDownButtonPageState();
}

class _DropDownButtonPageState extends State<DropDownButtonPage> {
  int dropDownValue = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDownValue = widget.listTotalProduct.isEmpty ? 12 : widget.listTotalProduct.last;

  }

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF8B9AD8),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          hint: Text(
            widget.listTotalProduct.isEmpty ? '1' : widget.listTotalProduct.length.toString(),
            style: TextStyle(color: Color(0xFF293771), fontSize: 12, fontWeight: FontWeight.bold),
          ),
          value: dropDownValue,
          icon: const Icon(Icons.arrow_drop_down_outlined, size: 18, color: Color(0xFF293771)),
          elevation: 14,
          style: const TextStyle(color: Color(0xFF293771), fontSize: 14, fontWeight: FontWeight.bold),
          dropdownColor: Color(0xFF8B9AD8),
          onChanged: (value) {
            dropDownValue = value!;
            productProvider.changePage(value);

          },
          items: widget.listTotalProduct.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(value.toString()),
              ),
            );
          }).toList(),
        ),
      ),
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


  @override
  Widget build(BuildContext context) {
    //dropDownValue = widget.list.first;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xFF293771),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text('Select Order'),
          value: widget.dropDownValue,
          // isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white,size: 30,),
          elevation: 14,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          dropdownColor: Color(0xFF293771),
          onChanged: (value) {
            setState(() {
              widget.onSaved(value);
              widget.onDropDownChanged(value);
            });
          },
          items: widget.paymentList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
