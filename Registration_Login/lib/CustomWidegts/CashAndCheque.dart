import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/BankWidget.dart';



class CashChequePartial extends StatefulWidget {
  const CashChequePartial({super.key});

  @override
  State<CashChequePartial> createState() => _CashChequePartialState();
}



class _CashChequePartialState extends State<CashChequePartial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cash Details'),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    label: Text('Amount in cash'),
                    fillColor: Color(0xFFFFFFFF),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Text('Cheque Details'),
        BankWidget(),
      ],
    );
  }
}
