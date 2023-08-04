import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



const List<String> list = <String>['ACENDING', 'DECENDING'];

class DropdownButtonExample extends StatefulWidget {
  final void Function(String? value) onSaved;
  const DropdownButtonExample({required this.onSaved, Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  String dropDownValue = '';

  @override
  void initState() {
    super.initState();
    dropDownValue = list.first;
     // Initialize the local dropdownValue with the value from widget
  }

  @override
  Widget build(BuildContext context) {
    //dropDownValue = widget.list.first;
    return DropdownButton<String>(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (value){
        dropDownValue = value!;
        setState(() {
          widget.onSaved(value);
        });

      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

    );
  }
}


const List<int> listTotalProduct = <int>[1,2,3,4,5,6,7,8,9,10,11,12];

class DropDownButtonPage extends StatefulWidget {
  final void Function(int? value) onChange;
  const DropDownButtonPage({required this.onChange, Key? key}) : super(key: key);

  @override
  State<DropDownButtonPage> createState() => _DropDownButtonPageState();
}

class _DropDownButtonPageState extends State<DropDownButtonPage> {

  int? dropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropDownValue = listTotalProduct.first;
  }

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<int>(
      value: dropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (value){
        dropDownValue = value;
        setState(() {
          widget.onChange(value);
        });

      },
      items: listTotalProduct.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),

    );
  }
}
