import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';



class PaymentMethods{


  DateTime selectedDate = DateTime.now();
  void _datePicker(BuildContext context){
    showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
  }


  List<String> bankList = ['HDFC', 'ICICI'];

  List<String> paymentOption = ['Cash', 'Online'];

  Widget CastWidget({required String text}){
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        height: 110,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount To Be Paid:\nRs.$text', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF293770)),),
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
  Widget PartialPaymentWidget({required int amount}){
    String? dropDownValue = paymentOption.first;
    TextEditingController amountController = TextEditingController();
    int totalAmount = amount;

    int remainingAmount = 0;

    void PendingAmount(String text){

      if(text.isNotEmpty){
        int payingAmount = int.tryParse(text) ?? 0;
        remainingAmount = totalAmount - payingAmount;

      }
    }

    return Container(
      height: 224,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 8, bottom: 5),
                  child: TextField(
                    controller: amountController,
                    onChanged: PendingAmount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text('Amount will be paying'),
                        fillColor: Color(0xFFFFFFFF),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(width: 7,),
              Expanded(
                flex: 1,
                child: StatusDropDown(
                  statusList: paymentOption,
                  onDropDownChanged: (String? value){
                    dropDownValue = value!;
                  },
                  dropDownValue: dropDownValue,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Text("Amount to be paid: ${amountController.text}"),
          SizedBox(height: 5,),
          Text('Remaining Amount: ${remainingAmount}'),
          SizedBox(height: 5,),
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
          )
        ],
      )
    );
  }
}