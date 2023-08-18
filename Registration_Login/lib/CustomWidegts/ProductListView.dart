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
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    PageController pageController = PageController(initialPage: 0);


    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: (productProvider.productFound.length / productProvider.productsToShow).ceil(),
            itemBuilder: (context, pageIndex) {
              productProvider.pageSorting(pageIndex);
              //list view
              return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: productProvider.productsOnPage.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: const Color(0xFFEEEEEE),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(productProvider.productsOnPage[index].productName,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Description: ${productProvider.productsOnPage[index].productDiscription}'),
                                Text('Product MRP: ${productProvider.productsOnPage[index].productPrice.toString()}'),
                                Text('Discount by seller: ${productProvider.productsOnPage[index].sellerDiscount.toString()}%'),
                                Text('Final Price: ${productProvider.productsOnPage[index].finalPrice.toString()}'),
                                Text('Seller: ${productProvider.productsOnPage[index].sellerName}'),
                                Text('Category: ${productProvider.productsOnPage[index].productCategories}'),
                                Text('Available Stocks: ${productProvider.productsOnPage[index].availableStock}'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: const Color(0xFF293771),
                                      child: IconButton(
                                          onPressed: () {
                                            // cart.addItems(
                                            //     product: productProvider.productsOnPage[index],
                                            //     productPrice: productProvider.productsOnPage[index].productPrice,
                                            //     discountPercent: productProvider.productsOnPage[index].sellerDiscount);
                                            productProvider.decreaseStocks(index);
                                          },

                                          icon: const Icon(
                                            Icons.add,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      cart.items.containsKey(
                                          productProvider.productsOnPage[index]
                                              .productName)
                                          ? cart
                                          .items[productProvider.productsOnPage[index]
                                          .productName]!
                                          .productQuantity
                                          .toString()
                                          : '0',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: const Color(0xFF293771),
                                      child: IconButton(
                                          onPressed: () {
                                            cart.subtractItems(product: productProvider.productsOnPage[index],
                                                price: productProvider.productsOnPage[index].productPrice);
                                            productProvider.productsOnPage[index].IncreaseStocks();
                                          },
                                          icon: const Icon(
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
                      if (pageController.page! > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
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
                      MaterialStateProperty.all<Color>(const Color(0xFF8B9AD8)),
                    ),
                    child: const Text(
                      'Previous',
                      style: TextStyle(color: Color(0xFF29376F)),
                    ),
                  ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (pageController.page! <
                        (productProvider.productList.length / productProvider.productsToShow).ceil() - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
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
                    MaterialStateProperty.all<Color>(const Color(0xFF8B9AD8)),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Color(0xFF29376F)),
                  ),
                ),
                const SizedBox(
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