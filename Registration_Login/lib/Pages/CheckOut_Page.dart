import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/CustomWidegts/custom_text_field.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';
import 'package:resgistration_login/Service/Order_Data.dart';
import 'package:resgistration_login/Service/product_data.dart';
import 'package:resgistration_login/Service/user_data.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}




class _CheckOutPageState extends State<CheckOutPage> {
  InputField iF = InputField();
  final TextEditingController _yourNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
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

    return Scaffold(
      backgroundColor: const Color(0xFF293770),
      appBar: AppBar(
        title: const Text('CheckOut'),
        backgroundColor: const Color(0xFF293771),
        centerTitle: true,

      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: const Color(0xFF8C9BDA),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.centerLeft ,
                              child: Text(
                                'Customer Details',
                                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
                          const SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF293771),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: const Text('Details', style: TextStyle(color: Colors.white),),
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                                  child: TextFormField(
                                    controller: _yourNameController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Your name not filled';
                                      }
                                    },
                                    style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black),),
                                    decoration: InputDecoration(
                                        fillColor: const Color(0xFFFFFFFF),
                                        filled: true,
                                        hintText: 'Your Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )),

                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                                  child: TextFormField(
                                    controller: _addressController,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Address not filled';
                                      }
                                    },
                                    style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black),),
                                    decoration: InputDecoration(
                                        fillColor: const Color(0xFFFFFFFF),
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
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                              child: Text('Payment Method',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white
                              ),
                              ),
                          ),
                          const SizedBox(height: 5,),
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
                          const SizedBox(height: 10),

                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF8C9BDA),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Bill Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), ),
                                  const SizedBox(height: 10,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Title', style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text('Amount', style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('MRP Amount:'),
                                      Text('$totalPrice'),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Discount:'),
                                      Text('$discountPrice'),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Total Amount:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      Text('$finalPrice', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 18.0, horizontal: 70)),
                                    shadowColor: MaterialStateProperty.all<Color>(const Color(0xFF6E81CE)),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60.0)
                                    )),
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff293772)),
                                  ),
                                  onPressed: (){
                                    if (_formKey.currentState!.validate()) {
                                      // Form is valid, perform your action here
                                      String userName = _yourNameController.text;
                                      String userAddress = _addressController.text;
                                      String dropDown = selectedPaymentMethod.toString();
                                      UserData.UserDetailsPost(userName, userAddress, dropDown);
                                      ProductData.changeAvailableProducts(cart.items.values.toList());
                                      Future.delayed(const Duration(seconds: 5), (){
                                        OrderData.AddBill(userName, totalPrice, discountPrice, finalPrice);
                                      });
                                      cart.clearCart();
                                      Navigator.pushNamed(context, '/ProductList');

                                    } else {
                                      // Form is invalid
                                    }

                                  },
                                  child:const Text('Submit', style: TextStyle(fontSize: 20.0, color: Color(0xFFF1F2EB)),),
                                ),
                              ),
                            ],
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

