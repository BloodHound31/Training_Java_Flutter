import 'package:flutter/material.dart';

class BankProvider with ChangeNotifier{

  DateTime _selectedDate = DateTime.now();

  final List<String> _bankList = ['HDFC', 'ICICI'];

  late String _selectedBank;

  DateTime get selectedDate => _selectedDate;

  List<String> get bankList => _bankList;

  String get selectedBank => _selectedBank;


  BankProvider(){
    _selectedBank = _bankList.first;
  }


  void onToggleChange(String? bank){
    _selectedBank = bank!;
    notifyListeners();
  }

  void changeDate({required BuildContext context}) async{

    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(dateTime != null){
      _selectedDate = dateTime;
    }
    notifyListeners();
  }




}