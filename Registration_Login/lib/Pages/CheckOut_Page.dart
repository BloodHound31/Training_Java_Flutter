import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  if(userName.isNotEmpty && userAddress.isNotEmpty && paymentOption.isNotEmpty){
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
  }else{
    print('fill details');
  }
}



class _CheckOutPageState extends State<CheckOutPage> {
  InputField iF = InputField();
  TextEditingController _yourNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> list = ['UPI','Cash on delivery'];

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
    final Map cartPageData = ModalRoute.of(context)?.settings.arguments as Map;

    final cart = Provider.of<CartItemProvider>(context);

    // List<CartItems> cartItems = cartPageData['CartItems'];
    double totalPrice = cartPageData['totalPrice'];
    double discountPrice = cartPageData['totalDiscount'];

    double FinalPrice(double originalPrice, double discountPercent){
      late double finalPrice;
      originalPrice = totalPrice;
      discountPercent = discountPrice;
      if(discountPercent > 0 && discountPercent < 100){
        double discountAmount = (originalPrice * discountPercent)/100;
        finalPrice = originalPrice - discountAmount;
      }
      return finalPrice;
    }

    double finalPrice = FinalPrice(totalPrice, discountPrice);

    print('build');
    return Scaffold(
      backgroundColor: Color(0xFF293770),
      appBar: AppBar(
        title: Text('CheckOut'),
        backgroundColor: Color(0xFF293771),
        centerTitle: true,

      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF8C9BDA),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF293771),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: Text('Details', style: TextStyle(color: Colors.white),),
                              subtitle: Text('User details here', style: TextStyle(color: Colors.grey.shade200),),
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                                  child: TextFormField(
                                    controller: _yourNameController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Your name not filled';
                                      }
                                    },
                                    style: GoogleFonts.oswald(textStyle: TextStyle(color: Colors.black),),
                                    decoration: InputDecoration(
                                        fillColor: Color(0xFFFFFFFFF),
                                        filled: true,
                                        hintText: 'Your Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )),

                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                                  child: TextFormField(
                                    controller: _addressController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Address not filled';
                                      }
                                    },
                                    style: GoogleFonts.oswald(textStyle: TextStyle(color: Colors.black),),
                                    decoration: InputDecoration(
                                        fillColor: Color(0xFFFFFFFFF),
                                        filled: true,
                                        hintText: 'Address',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: PaymentDropDown(
                                  dropDownValue: dropDownValue,
                                  paymentList: list,
                                  onSaved: onSaved,
                                  onDropDownChanged: handlePaymentMethodChange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),


                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF8C9BDA),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Bill Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text('MRP Amount: $totalPrice'),
                                  Divider(),
                                  Text('Discount: $discountPrice'),
                                  Divider(),
                                  Text('Total Amount: $finalPrice', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
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
                                cart.clearCart();

                              } else {
                                // Form is invalid
                                print('Something went wrong');
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
            ),
          ],
        ),
      ),
    );
  }
}

