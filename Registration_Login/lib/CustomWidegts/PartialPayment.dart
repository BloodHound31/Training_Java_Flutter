import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';

class PartialPayment extends StatefulWidget {
  final int amount;

  const PartialPayment({super.key, required this.amount});

  @override
  State<PartialPayment> createState() => _PartialPaymentState();
}

List<String> paymentOption = ['Cash', 'Online'];



class _PartialPaymentState extends State<PartialPayment> {

  TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = TextEditingController();

  }
  int remainingAmount = 0;

  @override
  Widget build(BuildContext context) {
    String? dropDownValue = paymentOption.first;



    //int totalAmount = widget.amount;

    void PendingAmount(String text){

      if(text.isNotEmpty){
        int payingAmount = int.tryParse(text) ?? 0;
        int pendingAmount = widget.amount - payingAmount;
        setState(() {
          remainingAmount = pendingAmount;
        });

      }
    }

    return Container(
        height: 224,
        width: double.infinity,
        child: SingleChildScrollView(
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
                        setState(() {
                          dropDownValue = value!;
                        });
                      },
                      dropDownValue: dropDownValue,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Text("Amount to be paid: ${amountController.text}"),
              SizedBox(height: 5,),
              Text('Remaining Amount: $remainingAmount'),
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
          ),
        )
    );
  }
}
