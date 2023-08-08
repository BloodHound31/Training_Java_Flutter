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
  //Sorting On Drop Down




  //Main Page
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    //List of products available
    var list = new List<int>.generate(productProvider.productList.length, (i) => i + 1);

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
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: TextField(
                onChanged: (value) => productProvider.SearchProduct(value),
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
            //Order change and number of items on page change dropdown
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonExample(
                    //onSaved: onSortOrderChanged,
                    productList: <String>['ACENDING', 'DECENDING'],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                DropDownButtonPage(
                  listTotalProduct: list,
                ),
              ],
            ),
            //PageView for making number of items appear no page
            Expanded(
              child:ProductListView(),
            ),
            //Visisblity
            Visibility(
              visible: (productProvider.productFound.length > productProvider.productsToShow),
              //Next and previus button
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.page! > 0) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF8B9AD8)),
                      ),
                      child: Text(
                        'Previous',
                        style: TextStyle(color: Color(0xFF29376F)),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_pageController.page! <
                            (productProvider.productList.length / productProvider.productsToShow).ceil() - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF8B9AD8)),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Color(0xFF29376F)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
