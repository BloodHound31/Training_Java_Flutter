import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/PartialPayment.dart';
import 'package:resgistration_login/CustomWidegts/PaymentMethodWidgets.dart';
import 'package:resgistration_login/Entity/BillingAddress.dart';
import 'package:resgistration_login/Entity/ProductDetails.dart';

import '../CustomWidegts/BankWidget.dart';
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


    print('Order details is being build');

    BillingAddress billingAddress = data['billingAddress'];
    List<ProductDetails> productSummary = data['productList'];

    int PayAmount(){
      int payAmount = 0;
      productSummary.forEach((element) {
        payAmount += element.totalProductPrice;
      });

      return payAmount;
    }


    //This is the payment methods widget
    Widget paymentDetailsWidget;

    switch (dropDownValue) {
      case 'Cash':
        paymentDetailsWidget = PaymentMethods().CastWidget(text: '${PayAmount()}');
        break;
      case 'Cheque':
        paymentDetailsWidget = Container(width: double.infinity, child: BankWidget());
        break;
      case 'Partial Payment':
        paymentDetailsWidget =  PartialPayment(amount: PayAmount());
        break;
      case 'Credit Note':
        paymentDetailsWidget = PaymentMethods().CreditNoteWidget();
        break;
      default:
        paymentDetailsWidget = Container(); // Default case
    }


    return Scaffold(
      backgroundColor: Color(0xFF29376F),
      appBar: AppBar(
        backgroundColor: Color(0xFF29376F),
        elevation: 0.0,
        title: Text('Order Details'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Color(0xFF8B9AD8),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Billing Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF29376F)
                  ),
                ),
                SizedBox(height: 20),
                Text('${billingAddress.buildingName}, ${billingAddress.streetName}, ${billingAddress.townName}, ${billingAddress.cityName}, ${billingAddress.stateName}, ${billingAddress.pinCode}',
                  style:TextStyle(
                    fontSize: 16,
                    color: Color(0xFF29376F),
                  ),),
                SizedBox(height: 10,),
                Divider( color: Color(0x8029376F), thickness: 1,),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text(
                      'Product Summary',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF29376F)
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          setState(() {
                            showWidget = !showWidget;
                          });

                        },
                        icon: Icon(Icons.edit, size: 16,))
                  ]
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: productSummary.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${productSummary[index].productName}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF29376F)),),
                              Text('Rs. ${productSummary[index].totalProductPrice}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF29376F)),),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Qty: ${productSummary[index].productQuantity}'),
                            showWidget ? Row(
                                children: [
                                   IconButton(
                                       onPressed: (){
                                         setState(() {
                                           productSummary[index].increaseProduct();
                                         });
                                       },
                                       icon: Icon(Icons.arrow_circle_up, size: 24,),
                                       color: Color(0xFF29376F)),
                                   IconButton(
                                       onPressed: (){
                                         setState(() {
                                           productSummary[index].decreaseProduct();
                                         });
                                       },
                                       icon: Icon(Icons.arrow_circle_down, size: 24,), color: Color(0xFF29376F)),
                                   IconButton(
                                     onPressed: (){
                                       setState(() {
                                         showWidget = !showWidget;
                                         productSummary[index].updateSummary();
                                       });
                                     },
                                     icon: Icon(Icons.check_circle_outline, size: 24,), color: Colors.green[900],),
                                   IconButton(
                                       onPressed: (){ setState(() {
                                          showWidget = !showWidget;
                                          productSummary[index].goToDefault();
                                       });
                                         },
                                       icon: Icon(Icons.cancel_outlined), color: Colors.red[800])
                                ],
                              ): Container(),
                            ],
                          ) ,
                        );
                      }),
                ),
                Text('Total Amount: ${PayAmount()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF29376E)),),
                Divider(color: Color(0x8029376F), thickness: 1,),
                Container(
                  height: 700,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF29376F)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Expanded(
                      child: PaymentSelectDropdown(
                          statusList: paymentList,
                          dropDownValue: dropDownValue,
                          onDropDownChanged: PaymentMethod,
                            ),
                          ),
                         // paymentDetailsWidget,
                        ],
                      ),
                      paymentDetailsWidget,
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




