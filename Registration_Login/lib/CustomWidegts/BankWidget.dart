import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';

class BankWidget extends StatefulWidget {
  const BankWidget({super.key});

  @override
  State<BankWidget> createState() => _BankWidgetState();
}

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

class _BankWidgetState extends State<BankWidget> {
  String? dropDownValue = bankList.first;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 5),
                      child: StatusDropDown(
                        statusList: bankList,
                        onDropDownChanged: (String? value){
                          setState(() {
                            dropDownValue = value!;
                          });
                        },
                        dropDownValue: dropDownValue,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            label: Text('Cheque Number'),
                            fillColor: Color(0xFFFFFFFF),
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
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 5),
                      child: ElevatedButton(
                        onPressed: (){
                          _datePicker(context);
                        },
                        child: Text(
                          'Pick Date',
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 5),
                      child: TextField(
                        decoration: InputDecoration(
                            label: Text('Name'),
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),
                  )

                ],
              ),
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
      ),
    );
  }
}
