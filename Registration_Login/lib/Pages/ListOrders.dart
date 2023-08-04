import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resgistration_login/Service/product_data.dart';

import'package:http/http.dart' as http;

import '../UI/CustomWidgets.dart';




const List<String> list = <String>['ACENDING', 'DECENDING'];
class ListOrders extends StatefulWidget {
  const ListOrders({super.key});

  @override
  State<ListOrders> createState() => _ListOrdersState();
}



class _ListOrdersState extends State<ListOrders> {

  //String dropDownValue = list.first;
  // Function to handle the dropdown selection
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

 List<ProductData> productList = [];

 Future<void> fetchProducts() async {

   final response = await http.get(Uri.parse('http://10.0.2.2:8080/Products'));

   if (response.statusCode == 200) {
     final List<dynamic> data = jsonDecode(response.body);
     List<ProductData> products = data.map((item) => ProductData.fromJson(item)).toList();


     //products.sort((a, b) => a.productName.compareTo(b.productName));
     setState(() {
       productList = products;
       foundProduct = productList;
     });

   } else {
     print('not found');
   }
 }

  List<ProductData> foundProduct= [];
  @override
  void initState() {
    // TODO: implement initState
    fetchProducts();
    super.initState();

  }

  void SearchProduct(String enteredKeyword){
    List<ProductData> result= [];
    if(enteredKeyword.isEmpty){
      result = productList;
    }else{
        result = productList.where((element) => element.productName.toLowerCase().contains(enteredKeyword.toLowerCase())
            || element.productCategories.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();

    }
    setState(() { foundProduct = result;});
  }

  int _pageToShow = 1;
  void changePage(int? enteredNumber){
    setState(() {
      _pageToShow = enteredNumber!;
    });
  }




  @override
  Widget build(BuildContext context) {

    //const List<String> list = <String>['ACENDING', 'DECENDING'];
    //productList.sort((a,b) => a.productName.compareTo(b.productName));

    PageController _pageController = PageController(initialPage: 0);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text('accountName'), accountEmail: Text('accountEmail')),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: (){
                Navigator.pushNamed(context, '/Home');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('My Store'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
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
            Container(
              margin: EdgeInsets.all(20),
                child: DropdownButtonExample(
                  onSaved: onSortOrderChanged,
                ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: DropDownButtonPage(
                onChange: changePage,
              ),
            ),
            Expanded(
              child: (foundProduct.length > _pageToShow)?PageView.builder(
                controller: _pageController,
                itemCount: (foundProduct.length / _pageToShow).ceil(),
                itemBuilder: (context, pageIndex) {
                  final int startIndex = pageIndex * _pageToShow;
                  final int endIndex =
                  (startIndex + _pageToShow < foundProduct.length) ? startIndex + _pageToShow : foundProduct.length;

                  final List<ProductData> productsOnPage = foundProduct.sublist(startIndex, endIndex);
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      itemCount: productsOnPage.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                          child: Card(
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(productsOnPage[index].productName),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Description: ${productsOnPage[index].productDiscription}'),
                                    Text('Product MRP: ${productsOnPage[index].productPrice.toString()}'),
                                    Text('Discount by seller: ${productsOnPage[index].sellerDiscount.toString()}%'),
                                    Text('Final Price: ${productsOnPage[index].finalPrice.toString()}'),
                                    Text('Seller: ${productsOnPage[index].sellerName}'),
                                    Text('Category: ${productsOnPage[index].productCategories}'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(onPressed: (){}, child: Text('Edit')),
                                        SizedBox(width: 10),
                                        ElevatedButton(onPressed: (){}, child: Text('Details')),
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
              ):
              ListView.builder(
                itemCount: foundProduct.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(foundProduct[index].productName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product Discription: ${foundProduct[index].productDiscription}'),
                              Text('Product MRP: ${foundProduct[index].productPrice.toString()}'),
                              Text('Discount by seller: ${foundProduct[index].sellerDiscount.toString()}%'),
                              Text('Final Price: ${foundProduct[index].finalPrice.toString()}'),
                              Text('Seller: ${foundProduct[index].sellerName}'),
                              Text('Category: ${foundProduct[index].productCategories}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(onPressed: (){}, child: Text('Edit')),
                                  SizedBox(width: 10),
                                  ElevatedButton(onPressed: (){}, child: Text('Details')),
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
            ),
            Visibility(
              visible: (foundProduct.length > _pageToShow),
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
                      if (_pageController.page! < (productList.length / 5).ceil() - 1) {
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


