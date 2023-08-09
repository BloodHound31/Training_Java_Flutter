import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';
import 'package:resgistration_login/Service/product_data.dart';



class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {



  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);


    print('Object 1');

    PageController _pageController = PageController(initialPage: 0);

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: (productProvider.productFound.length / productProvider.productsToShow).ceil(),
            itemBuilder: (context, pageIndex) {
              final int startIndex = pageIndex * productProvider.productsToShow;
              final int endIndex =
              (startIndex + productProvider.productsToShow < productProvider.productFound.length)
                  ? startIndex + productProvider.productsToShow
                  : productProvider.productFound.length;

              final List<ProductData> productsOnPage =
              productProvider.productFound.sublist(startIndex, endIndex);
              //list view
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: productsOnPage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Color(0xFFEEEEEE),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(productsOnPage[index].productName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Description: ${productsOnPage[index].productDiscription}'),
                                Text('Product MRP: ${productsOnPage[index].productPrice.toString()}'),
                                Text('Discount by seller: ${productsOnPage[index].sellerDiscount.toString()}%'),
                                Text('Final Price: ${productsOnPage[index].finalPrice.toString()}'),
                                Text('Seller: ${productsOnPage[index].sellerName}'),
                                Text('Category: ${productsOnPage[index].productCategories}'),
                                Text('Available Stocks: ${productsOnPage[index].availableStock}'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFF293771),
                                      child: IconButton(
                                          onPressed: () {
                                            cart.addItems(
                                                product: productsOnPage[index],
                                                productPrice: productsOnPage[index].productPrice,
                                                discountPercent: productsOnPage[index].sellerDiscount);
                                            productsOnPage[index].DecreaseStocks();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      cart.items.containsKey(
                                          productsOnPage[index]
                                              .productName)
                                          ? cart
                                          .items[productsOnPage[index]
                                          .productName]!
                                          .productQuantity
                                          .toString()
                                          : '0',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFF293771),
                                      child: IconButton(
                                          onPressed: () {
                                            cart.subtractItems(product: productsOnPage[index],
                                                price: productsOnPage[index].productPrice);
                                            productsOnPage[index].IncreaseStocks();
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                    ),
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
          ),
        ),
        Visibility(
          visible: (productProvider.productList.length > productProvider.productsToShow),
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
    );
  }
}