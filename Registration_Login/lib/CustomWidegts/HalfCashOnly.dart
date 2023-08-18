import 'package:flutter/material.dart';

class HalfCash extends StatefulWidget {
  final int amount;
  const HalfCash({super.key, required this.amount});

  @override
  State<HalfCash> createState() => _HalfCashState();
}


TextEditingController amountController = TextEditingController();


int remainingAmount = 0;


class _HalfCashState extends State<HalfCash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = TextEditingController();
  }


  void PendingAmount(String text){

    if(text.isNotEmpty){
      int payingAmount = int.tryParse(text) ?? 0;
      int pendingAmount = widget.amount - payingAmount;
      setState(() {
        remainingAmount = pendingAmount;
      });

    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        height: 224,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 5),
                      child: TextField(
                        controller: amountController,
                        onChanged: PendingAmount,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: const Text('Amount will be paying'),
                            fillColor: const Color(0xFFFFFFFF),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 7,),

              const SizedBox(height: 5),
              Text("Amount to be paid: ${amountController.text}"),
              const SizedBox(height: 5,),
              Text('Remaining Amount: $remainingAmount'),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF293770))
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
