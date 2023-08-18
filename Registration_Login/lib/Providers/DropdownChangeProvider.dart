import 'package:flutter/cupertino.dart';

import '../CustomWidegts/BankWidget.dart';
import '../CustomWidegts/PartialPayment.dart';
import '../CustomWidegts/PaymentMethodWidgets.dart';

class DropdownChangeProvider with ChangeNotifier{

  final List<String> _paymentList = ['Cash', 'Cheque', 'Partial Payment', 'Credit Note'];

  late String _selectedMethod;
  Widget _paymentDetailsWidget = Container();

  List<String> get paymentList => _paymentList;

  String get selectedMethod => _selectedMethod;

  Widget get paymentDetailsWidget => _paymentDetailsWidget;

  DropdownChangeProvider(){
    _selectedMethod = _paymentList.first;
  }

  void ToggleChange(String? value){
    _selectedMethod = value!;
    notifyListeners();
  }

  void SwitchWidget({required int text}){

    switch (_selectedMethod) {
      case 'Cash':
        _paymentDetailsWidget = PaymentMethods().CastWidget(text: '$text');
        break;
      case 'Cheque':
        _paymentDetailsWidget = Container(width: double.infinity, child: BankWidget());
        break;
      case 'Partial Payment':
        _paymentDetailsWidget =  PartialPayment(amount: text);
        break;
      case 'Credit Note':
        _paymentDetailsWidget = PaymentMethods().CreditNoteWidget();
        break;
      default:
        _paymentDetailsWidget; // Default case
    }

    notifyListeners();

  }

}