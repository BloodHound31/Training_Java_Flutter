import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';
import 'package:resgistration_login/Entity/BillingAddress.dart';
import 'package:resgistration_login/Entity/ProductDetails.dart';
import 'package:resgistration_login/Providers/Order_Provider.dart';
import 'package:resgistration_login/Service/Order_Data.dart';




class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}




List<String> statusList = ['All', 'Pending', 'Full Cancel', 'Delivered', 'PartialCancelled'];


class _OrderListState extends State<OrderList> {



  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context, listen: false);

    print('This is being build');
    return Scaffold(
      backgroundColor: Color(0xFF293770),
      appBar: AppBar(
        title: Text('Order History'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF293770),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF8C9BDA),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Consumer<OrderProvider>(builder: (_, orderDetails, child) {
                      return TextField(
                        onChanged: (value) => orderDetails.SearchProduct(value),
                        decoration: InputDecoration(
                            fillColor: Color(0xFFF1F2EB),
                            filled: true,
                            labelText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      );
                    },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Consumer<OrderProvider>(builder: (_, orderDetails, child) {
                      return StatusDropDown(
                        statusList: statusList,
                        onDropDownChanged: (value) {
                          orderDetails.sortByStatus(value);
                        },
                        dropDownValue: orderDetails.selectedStatus,
                      );
                    },),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
            Consumer<OrderProvider>(
                builder: (_,orderDetails,child){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: orderDetails.filteredList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color(0xFFEEEEEE),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ExpansionTile(
                                childrenPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                title: Text('${orderDetails.filteredList[index].customerName}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Bill No. ${orderDetails.filteredList[index].id}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Mrp Amount:'),
                                          Text('${orderDetails.filteredList[index].totalMrp}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total Discount:'),
                                          Text('${orderDetails.filteredList[index].totalDiscount}')
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Total Amount:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                          Text('${orderDetails.filteredList[index].payAmount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                                        ],
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          orderDetails.CustomStatus(index),
                                          ElevatedButton(
                                            onPressed: (){

                                              Navigator.pushNamed(context, '/OrderDetails',
                                                  arguments: {
                                                    'billingAddress': orderDetails.filteredList[index].billingAddress,
                                                    'productList': orderDetails.filteredList[index].productList});
                                            },
                                            child: Text('Order Details'),
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF293770)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)),
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
