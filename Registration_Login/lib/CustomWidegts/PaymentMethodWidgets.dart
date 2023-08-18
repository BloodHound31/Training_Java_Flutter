import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/OrderDetailsProvider.dart';



class PaymentMethods{



  Widget CastWidget({required String text}){
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        height: 110,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<OrderDetailsProvider>(builder: (context, value, child) => Text('Amount To Be Paid:\nRs.${value.PayAmount()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF293770)),),),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF293770))
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget CreditNoteWidget(){
    return Container(
      height: 100,
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          Text('This is credit Note payment option'),
        ],
      )
    );
  }

}