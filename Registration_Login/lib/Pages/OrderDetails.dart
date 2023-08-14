import 'package:flutter/material.dart';
import 'package:resgistration_login/Entity/BillingAddress.dart';
import 'package:resgistration_login/Entity/ProductDetails.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

bool showWidget = false;
class _OrderDetailsState extends State<OrderDetails> {



  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    BillingAddress billingAddress = data['billingAddress'];
    List<ProductDetails> productSummary = data['productList'];



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

                        print(showWidget);
                      },
                      icon: Icon(Icons.edit, size: 16,))
                ]
              ),
              SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
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
                                       // productSummary[index].initialQuantity = productSummary[index].productQuantity;
                                       // productSummary[index].initialTotal = productSummary[index].totalProductPrice;
                                     });
                                   },
                                   icon: Icon(Icons.check_circle_outline, size: 24,), color: Colors.green[900],),
                                 IconButton(
                                     onPressed: (){ setState(() {
                                        showWidget = !showWidget;
                                        productSummary[index].goToDefault();
                                        //productSummary[index].productQuantity = productSummary[index].initialQuantity;
                                        //productSummary[index].totalProductPrice;
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
              Divider(color: Color(0x8029376F), thickness: 1,),
              Expanded(
                child: Text(
                  'Payment Summary',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF29376F)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
