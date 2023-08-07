import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Service/product_data.dart';

import 'package:resgistration_login/CustomWidegts/Custom_DropDown.dart';

import '../Providers/Cart_Provider.dart';

class ListOrders extends StatefulWidget {
  const ListOrders({super.key});

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  //Sorting On Drop Down
  void onSortOrderChanged(String? value) {
    print('this: $value');
    setState(() {
      // Sort the foundProduct list based on the selected value
      if (value == 'ACENDING') {
        foundProduct.sort((a, b) => a.productName.compareTo(b.productName));
      } else if (value == 'DECENDING') {
        foundProduct.sort((a, b) => b.productName.compareTo(a.productName));
      }
    });
  }

  //List Of Products
  List<ProductData> productList = [];

  //Get the list of products
  Future<void> getProducts() async {
    await ProductData.fetchProducts();
    setState(() {
      productList = ProductData.products;
      foundProduct = productList;
    });
  }

  List<ProductData> foundProduct = [];
  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();
  }

  //Search Products
  void SearchProduct(String enteredKeyword) {
    List<ProductData> result = [];
    if (enteredKeyword.isEmpty) {
      result = productList;
    } else {
      result = productList
          .where((element) =>
              element.productName
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              element.productCategories
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProduct = result;
    });
  }

  //Number of products on page
  int _pageToShow = 12;
  void changePage(int? enteredNumber) {
    setState(() {
      _pageToShow = enteredNumber!;
    });
  }

  //Main Page
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);

    //List of products available
    var list = new List<int>.generate(productList.length, (i) => i + 1);

    PageController _pageController = PageController(initialPage: 0);

    return Scaffold(
      //Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('accountName'),
                accountEmail: Text('accountEmail')),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('Cart'),
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
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
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
                onChanged: (value) => SearchProduct(value),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            //Order change and number of items on page change dropdown
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButtonExample(
                    onSaved: onSortOrderChanged,
                    productList: <String>['ACENDING', 'DECENDING'],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                DropDownButtonPage(
                  listTotalProduct: list,
                  onChange: changePage,
                ),
              ],
            ),
            //PageView for making number of items appear no page
            Expanded(
                child: PageView.builder(
              controller: _pageController,
              itemCount: (foundProduct.length / _pageToShow).ceil(),
              itemBuilder: (context, pageIndex) {
                final int startIndex = pageIndex * _pageToShow;
                final int endIndex =
                    (startIndex + _pageToShow < foundProduct.length)
                        ? startIndex + _pageToShow
                        : foundProduct.length;

                final List<ProductData> productsOnPage =
                    foundProduct.sublist(startIndex, endIndex);
                //list view
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: productsOnPage.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 4.0),
                        child: Card(
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(productsOnPage[index].productName),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Product Description: ${productsOnPage[index].productDiscription}'),
                                  Text(
                                      'Product MRP: ${productsOnPage[index].productPrice.toString()}'),
                                  Text(
                                      'Discount by seller: ${productsOnPage[index].sellerDiscount.toString()}%'),
                                  Text(
                                      'Final Price: ${productsOnPage[index].finalPrice.toString()}'),
                                  Text(
                                      'Seller: ${productsOnPage[index].sellerName}'),
                                  Text(
                                      'Category: ${productsOnPage[index].productCategories}'),
                                  Text(
                                      'Available Stocks: ${productsOnPage[index].availableStock}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cart.addItems(
                                                product:
                                                    productsOnPage[index],
                                                productPrice: productsOnPage[index]
                                                    .finalPrice);
                                            productsOnPage[index]
                                                .DecreaseStocks();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 35,
                                            color: Colors.blue,
                                          )),
                                      Text(cart.items.containsKey(
                                              productsOnPage[index].productName)
                                          ? cart
                                              .items[productsOnPage[index]
                                                  .productName]!
                                              .productQuantity
                                              .toString()
                                          : '0'),
                                      IconButton(
                                          onPressed: () {
                                            cart.subtractItems(
                                                product: productsOnPage[index],
                                                price: productsOnPage[index]
                                                    .finalPrice);
                                            productsOnPage[index]
                                                .IncreaseStocks();
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                            size: 35,
                                            color: Colors.blue,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )),
            //Visisblity
            Visibility(
              visible: (foundProduct.length > _pageToShow),
              //Next and previus button
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Text('Previous'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_pageController.page! <
                          (productList.length / _pageToShow).ceil() - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
