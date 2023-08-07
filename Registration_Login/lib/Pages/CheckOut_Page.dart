import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}



String url = 'https://jsonplaceholder.typicode.com/posts';


void postData(String userName, String userAddress, String paymentOption) async{
  try{
    final response = await http.post(Uri.parse(url), body: {
      'userName': userName,
      'userAddress': userAddress,
      'paymentOption': paymentOption,
    });

    if (response.statusCode == 201) {
      // Print the response body
      print('Response Body: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

  }catch(e){

  }
}



class _CheckOutPageState extends State<CheckOutPage> {
  InputField iF = InputField();
  TextEditingController _yourNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> list = ['upi','cod'];

  String? dropDownValue = '';

  String? selectedPaymentMethod;

  void handlePaymentMethodChange(String? value) {
    setState(() {
      selectedPaymentMethod = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    dropDownValue = list.first;
    super.initState();
  }

  void onSaved(String? value){

    setState(() {
      dropDownValue = value!;
    });
  }




  @override
  Widget build(BuildContext context) {
    final List<CartItems> cartItems = ModalRoute.of(context)?.settings.arguments as List<CartItems>;

    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text('CheckOut'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            iF.InputText(
                              textField: 'Your Name',
                              controller: _yourNameController,
                            ),
                            SizedBox(height: 10),
                            iF.InputText(
                              textField: 'Address',
                              controller: _addressController,
                            ),
                            SizedBox(height: 10),
                            PaymentDropDown(
                              dropDownValue: dropDownValue,
                              paymentList: list,
                              onSaved: onSaved,
                              onDropDownChanged: handlePaymentMethodChange,
                            ),
                            SizedBox(height: 30,),
                            //Implementation Remaining
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                final cartItem = cartItems[index];
                                return ListTile(
                                  title: Text(cartItem.product.productName),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Price: ${cartItem.product.productPrice}'),
                                      Text('Quantity: ${cartItem.productQuantity}'),
                                      Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 50,),

                            ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 18.0, horizontal: 70)),
                                shadowColor: MaterialStateProperty.all<Color>(Color(0xFF6E81CE)),
                                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0)
                                )),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff293772)),
                              ),
                              onPressed: (){

                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, perform your action here
                                  String userName = _yourNameController.text;
                                  String userAddress = _addressController.text;
                                  String dropDown = selectedPaymentMethod.toString();
                                  postData(userName, userAddress, dropDown);

                                } else {
                                  // Form is invalid
                                 print('Something went wrong');
                                  //user.ShowToast("SomeThing is missing");
                                }

                              },
                              child:Text('Submit', style: TextStyle(fontSize: 20.0, color: Color(0xFFF1F2EB)),),
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
