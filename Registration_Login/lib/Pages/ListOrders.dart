import 'package:flutter/material.dart';
import 'package:resgistration_login/Service/product_data.dart';

class ListOrders extends StatefulWidget {
  const ListOrders({super.key});

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {

  List<ProductData> productList = [
    ProductData(productName: 'Cooking Oil', productPrice: 150.00, sellerDiscount: 3.00, sellerName: 'xxBrandSeller', productDiscription: 'This is Cooking oil discription', productCategories: 'Cooking essentials'),
    ProductData(productName: 'AA Batteries', productPrice: 50.00, sellerDiscount: 2.00, sellerName: 'xyBrandSeller', productDiscription: 'This is AA Batteries discription', productCategories: 'Electronics'),
    ProductData(productName: 'Shampoo', productPrice: 150.00, sellerDiscount: 3.00, sellerName: 'xzBrandSeller', productDiscription: 'This is Shampoo discription', productCategories: ' Hair Care'),
    ProductData(productName: 'Laundry Detergent', productPrice: 250.00, sellerDiscount: 5.00, sellerName: 'xxBrandSeller', productDiscription: 'This is Laundry Detergent discription', productCategories: 'Household Essentials'),
    ProductData(productName: 'Trash Bags', productPrice: 60.00, sellerDiscount: 2.00, sellerName: 'xxBrandSeller', productDiscription: 'This is Trash Bags discription', productCategories: 'Household essentials'),
    ProductData(productName: 'Notepad', productPrice: 100.00, sellerDiscount: 10.00, sellerName: 'xxBrandSeller', productDiscription: 'This is Notepad discription', productCategories: 'Stationery'),
    ProductData(productName: 'Ball Pen Pack', productPrice: 150.00, sellerDiscount: 2.00, sellerName: 'xxBrandSeller', productDiscription: 'This is Ball Pen Pack discription', productCategories: 'Stationery')
  ];


  List<ProductData> foundProduct= [];
  @override
  void initState() {
    // TODO: implement initState
    foundProduct = productList;
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


  @override
  Widget build(BuildContext context) {

    PageController _pageController = PageController(initialPage: 0);
    productList.sort((a,b) => a.productName.compareTo(b.productName));
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
            Expanded(
              child: (foundProduct.length > 5)?PageView.builder(
                controller: _pageController,
                itemCount: (foundProduct.length / 5).ceil(),
                itemBuilder: (context, pageIndex) {
                  final int startIndex = pageIndex * 5;
                  final int endIndex =
                  (startIndex + 5 < foundProduct.length) ? startIndex + 5 : foundProduct.length;

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
                                    Text('Product Discription: ${productsOnPage[index].productDiscription}'),
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
            Row(
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
          ],
        ),
      ),
    );
  }
}
