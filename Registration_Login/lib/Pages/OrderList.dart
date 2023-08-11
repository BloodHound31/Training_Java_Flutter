import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';
import 'package:resgistration_login/Service/Order_Data.dart';




class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}


List<OrderData> orderList = [
  OrderData(id: 1, totalMrp: 300, totalDiscount: 50, payAmount: 100, orderStatus: 'Pending', productName: 'Bath Soap', productQuantity: 5),
  OrderData(id: 2, totalMrp: 500, totalDiscount: 100, payAmount: 400, orderStatus: 'Pending', productName: 'ToothBrush', productQuantity: 10),
  OrderData(id: 3, totalMrp: 500, totalDiscount: 100, payAmount: 400, orderStatus: 'PartialCancelled', productName: 'Notebook', productQuantity: 10),
  OrderData(id: 4, totalMrp: 900, totalDiscount: 200, payAmount: 700, orderStatus: 'Full Cancel', productName: 'Pen', productQuantity: 10),
  OrderData(id: 5, totalMrp: 1000, totalDiscount: 100, payAmount: 900, orderStatus: 'Delivered', productName: 'Coca Cola', productQuantity: 5)
];


Color getStatusColorChange(String status){
  switch(status){
    case 'Pending':
      return Colors.red;
    case 'PartialCancelled':
      return Colors.yellow;
    case 'Full Cancel':
      return Colors.orange;
    case 'Delivered':
      return Colors.green;
    default:
      return Colors.grey;
  }
}
List<String> statusList = ['All', 'Pending', 'Full Cancel', 'Delivered', 'PartialCancelled'];

List<OrderData> filteredItems = orderList;

//Search Products
void SearchProduct(String enteredKeyword) {
  List<OrderData> result = [];
  if (enteredKeyword.isEmpty) {
    result = orderList;
  } else {
    result = orderList
        .where((element) =>
    element.productName
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();
  }

        filteredItems = result!;
}




class _OrderListState extends State<OrderList> {



  String? selectedStatus = statusList.first;

  void sortByStatus(String? value) {
    setState(() {
      selectedStatus = value!;
      filteredItems = selectedStatus == 'All' ? orderList : orderList.where((item) => item.orderStatus == selectedStatus).toList();
    });
  }


  Widget CustomStatus(int index){
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: getStatusColorChange(filteredItems[index].orderStatus),
          radius: 7,
        ),
        SizedBox(width: 5,),
        Text('${filteredItems[index].orderStatus}')
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
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
                    child: TextField(
                      onChanged: (value){
                        SearchProduct(value);
                        setState(() {

                        });
                        },
                      decoration: InputDecoration(
                          fillColor: Color(0xFFF1F2EB),
                          filled: true,
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: StatusDropDown(
                      statusList: statusList,
                      onDropDownChanged: sortByStatus,
                      dropDownValue: selectedStatus,
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
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
                          title: Text('${filteredItems[index].productName}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'Bill No. ${filteredItems[index].id}',
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
                                    Text('${filteredItems[index].totalMrp}')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Discount:'),
                                    Text('${filteredItems[index].totalDiscount}')
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Amount:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                    Text('${filteredItems[index].payAmount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomStatus(index),
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.pushNamed(context, '/OrderDetails');
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
            )
          ],
        ),
      ),
    );
  }
}
