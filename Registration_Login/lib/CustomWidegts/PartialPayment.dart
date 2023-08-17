import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/CashAndCheque.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';
import 'package:resgistration_login/CustomWidegts/HalfCashOnly.dart';

class PartialPayment extends StatefulWidget {
  final int amount;

  const PartialPayment({super.key, required this.amount});

  @override
  State<PartialPayment> createState() => _PartialPaymentState();
}

List<String> paymentOption = ['Cash & Cheque', 'Half Cash Only', 'Half Cash & Half Credit'];



class _PartialPaymentState extends State<PartialPayment> {



  String? dropDownValue = paymentOption.first;

  @override
  Widget build(BuildContext context) {

    print('Provider Needed');
    //This is the payment methods widget
    Widget paymentDetailsWidget;

    switch (dropDownValue) {
      case 'Cash & Cheque':
        paymentDetailsWidget = CashChequePartial();
        break;
      case 'Half Cash Only':
        paymentDetailsWidget = HalfCash(amount: widget.amount,);
        break;
      case 'Half Cash & Half Credit':
        paymentDetailsWidget =  Container(child: Text('This is Half Cash & Half Credit'),);
        break;
      default:
        paymentDetailsWidget = Container(); // Default case
    }




    return Container(
      height: 600,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: StatusDropDown(
                  statusList: paymentOption,
                  onDropDownChanged: (String? value){
                    setState(() {
                      dropDownValue = value!;
                    });
                  },
                  dropDownValue: dropDownValue,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          paymentDetailsWidget,
        ],
      ),
    );
  }
}
