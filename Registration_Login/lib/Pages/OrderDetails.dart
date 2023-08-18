import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Entity/BillingAddress.dart';
import 'package:resgistration_login/Entity/ProductDetails.dart';
import 'package:resgistration_login/Providers/DropdownChangeProvider.dart';
import 'package:resgistration_login/Providers/OrderDetailsProvider.dart';

import '../CustomWidegts/Custom_DropDown.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

bool showWidget = false;
bool showTheDetails = false;
List<String> paymentList = ['Cash', 'Cheque', 'Partial Payment', 'Credit Note'];

class _OrderDetailsState extends State<OrderDetails> {

  String? dropDownValue = paymentList.first;

  void PaymentMethod(String? value){
    dropDownValue = value!;
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;


    BillingAddress billingAddress = data['billingAddress'];
    List<ProductDetails> productSummary = data['productList'];

    final orderDetailsProvider = Provider.of<OrderDetailsProvider>(context, listen: false);


    int PayAmount(){
      int payAmount = 0;
      productSummary.forEach((element) {
        payAmount += element.totalProductPrice;
      });

      return payAmount;
    }


    return Scaffold(
      backgroundColor: const Color(0xFF29376F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF29376F),
        elevation: 0.0,
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF8B9AD8),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Billing Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF29376F)
                  ),
                ),
                const SizedBox(height: 20),
                Text('${billingAddress.buildingName}, ${billingAddress.streetName}, ${billingAddress.townName}, ${billingAddress.cityName}, ${billingAddress.stateName}, ${billingAddress.pinCode}',
                  style:const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF29376F),
                  ),),
                const SizedBox(height: 10,),
                const Divider( color: Color(0x8029376F), thickness: 1,),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    const Text(
                      'Product Summary',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF29376F)
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          orderDetailsProvider.toggleWidget();
                        },
                        icon: const Icon(Icons.edit, size: 16,))
                  ]
                ),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productSummary.length,
                      itemBuilder: (context, index){
                        //orderDetailsProvider.InitializeQuantity(productSummary[index].productQuantity);
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(productSummary[index].productName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF29376F)),),
                              Selector<OrderDetailsProvider, int>(
                                selector: (_, orderDetailsProvider) => orderDetailsProvider.productSummary[index].totalProductPrice,
                                builder: (context, value, child) => Text('Rs. $value', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF29376F)),),
                              )
                                ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Selector<OrderDetailsProvider, int>(
                                  selector: (_, orderDetailsProvider) => orderDetailsProvider.productSummary[index].productQuantity,
                                  builder: (context, value, child) => Text('Qty: $value')),
                              Selector<OrderDetailsProvider, bool>(
                                selector: (_, orderDetailsProvider) => orderDetailsProvider.showWidget,
                                builder: (context, value, child) {
                                  print('selector called');
                                  return value ? Row(
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            orderDetailsProvider.increaseProduct(index);
                                          },
                                          icon: const Icon(Icons.arrow_circle_up, size: 24,),
                                          color: const Color(0xFF29376F)),
                                      IconButton(
                                          onPressed: (){

                                            orderDetailsProvider.decreaseProduct(index);

                                          },
                                          icon: const Icon(Icons.arrow_circle_down, size: 24,), color: const Color(0xFF29376F)),
                                      IconButton(
                                        onPressed: (){
                                          orderDetailsProvider.toggleWidget();
                                          orderDetailsProvider.updateSummary(index);
                                        },
                                        icon: const Icon(Icons.check_circle_outline, size: 24,), color: Colors.green[900],),
                                      IconButton(
                                          onPressed: (){
                                            orderDetailsProvider.toggleWidget();
                                            orderDetailsProvider.goToDefault(index);
                                          },
                                          icon: const Icon(Icons.cancel_outlined), color: Colors.red[800])
                                    ],
                                  ): Container();
                                },),
                            ],
                          ) ,
                        );
                      }),
                ),
               Selector<OrderDetailsProvider, int>(
                 selector: (_, orderDetailsProvider) => orderDetailsProvider.PayAmount(),
                 builder: (_, value, __) =>  Text('Total Amount: $value', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF29376E)),),),
                const Divider(color: Color(0x8029376F), thickness: 1,),
                Container(
                  height: 700,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF29376F)
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Expanded(
                      child: Consumer<DropdownChangeProvider>(builder: (context, dropDownChange, child) {
                        return PaymentSelectDropdown(
                          statusList: dropDownChange.paymentList,
                          dropDownValue: dropDownChange.selectedMethod,
                          onDropDownChanged: (value) {
                            dropDownChange.ToggleChange(value);
                            dropDownChange.SwitchWidget(text: PayAmount());
                          },
                        );
                      },
                      ),
                          ),
                         // paymentDetailsWidget,
                        ],
                      ),
                      Consumer<DropdownChangeProvider>(builder: (context, value, child) =>  value.paymentDetailsWidget,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
