import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';

import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';

import '../Providers/Cart_Provider.dart';
import 'package:resgistration_login/CustomWidegts/ProductListView.dart';

class ListOrders extends StatefulWidget {
  const ListOrders({super.key});

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {

  //Main Page
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    var list = new List<int>.generate(
        productProvider.productList.length, (i) => i + 1);

    PageController _pageController = PageController(initialPage: 0);
    print('product built');

    return Scaffold(
      backgroundColor: Color(0xFF293770),
      //Drawer
      drawer: Drawer(
        backgroundColor: Color(0xFF29376F),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('accountName'),
                accountEmail: Text('accountEmail')),
            ListTile(
              leading: Icon(Icons.login, color: Colors.white),
              title: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded, color: Colors.white),
              title: Text('Cart', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/YourCart');
              },
            )
          ],
        ),
      ),
      //AppBar
      appBar: AppBar(
        title: Text('My Store'),
        backgroundColor: Color(0xFF29376F),
        centerTitle: true,
      ),
      // backgroundColor: Colors.grey[900],
      body: SafeArea(
        //Full widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search bar
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Consumer<ProductProvider>(
                        builder: (context, value, child) {
                      return TextField(
                        onChanged: (value) =>
                            productProvider.SearchProduct(value),
                        decoration: InputDecoration(
                            fillColor: Color(0xFFF1F2EB),
                            filled: true,
                            labelText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonExample(
                      productList: <String>['A-Z', 'Z-A'],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: DropDownButtonPage(
                      listTotalProduct: list,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: ProductListView(),
            ),
          ],
        ),
      ),
    );
  }
}
