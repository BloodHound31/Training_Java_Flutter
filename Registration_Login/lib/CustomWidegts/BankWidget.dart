import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';

import '../Providers/BankProvider.dart';

class BankWidget extends StatefulWidget {
  const BankWidget({super.key});

  @override
  State<BankWidget> createState() => _BankWidgetState();
}

  DateTime selectedDate = DateTime.now();


  List<String> bankList = ['HDFC', 'ICICI'];

class _BankWidgetState extends State<BankWidget> {
  String? dropDownValue = bankList.first;

  @override
  Widget build(BuildContext context) {
    final banksProvider = Provider.of<BankProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 5),
                child: Consumer<BankProvider>(builder: (context, bankProvider, child) {
                  return StatusDropDown(
                    statusList: bankProvider.bankList,
                    onDropDownChanged: (value) => bankProvider.onToggleChange(value),
                    dropDownValue: bankProvider.selectedBank,
                  );
                }),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      label: const Text('Cheque Number'),
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
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: (){
                  banksProvider.changeDate(context: context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF293770))
                ),
                child: const Text(
                  'Pick Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Consumer<BankProvider>(builder: (context, bankProvider, child) {
                  return Text(
                    '${bankProvider.selectedDate.day}-${bankProvider.selectedDate.month}-${bankProvider.selectedDate.year}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF293770),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      label: const Text('Name'),
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
    );
  }
}
