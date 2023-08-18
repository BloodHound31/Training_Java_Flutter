import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';
import 'package:resgistration_login/Providers/Order_Provider.dart';

import '../Providers/OrderDetailsProvider.dart';




class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}


class _OrderListState extends State<OrderList> {

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context, listen: false);
    final orderDetailsList = Provider.of<OrderDetailsProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF293770),
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFF293770),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF8C9BDA),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child:TextField(
                        onChanged: (value) => orderList.SearchProduct(value),
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF1F2EB),
                            filled: true,
                            labelText: 'Search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Consumer<OrderProvider>(builder: (_, orderList, child) {
                      return StatusDropDown(
                        statusList: orderList.statusList,
                        onDropDownChanged: (value) => orderList.sortByStatus(value),
                        dropDownValue: orderList.selectedStatus,
                      );
                    },),
                  ),
                  const SizedBox(width: 5),
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
                          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: const Color(0xFFEEEEEE),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ExpansionTile(
                                childrenPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                title: Text(orderDetails.filteredList[index].customerName,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Bill No. ${orderDetails.filteredList[index].id}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  const Divider(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Mrp Amount:'),
                                          Text('${orderDetails.filteredList[index].totalMrp}')
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Total Discount:'),
                                          Text('${orderDetails.filteredList[index].totalDiscount}')
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Total Amount:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                          Text('${orderDetails.filteredList[index].payAmount}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                                        ],
                                      ),
                                      const SizedBox(height: 15,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          orderDetails.CustomStatus(index),
                                          ElevatedButton(
                                            onPressed: (){

                                              orderDetailsList.IntializeValue(orderDetails.filteredList[index].productList);
                                              Navigator.pushNamed(context, '/OrderDetails',
                                                  arguments: {
                                                    'billingAddress': orderDetails.filteredList[index].billingAddress,
                                                    'productList': orderDetails.filteredList[index].productList});
                                            },
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF293770)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)),
                                                )
                                            ),
                                            child: const Text('Order Details'),
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
