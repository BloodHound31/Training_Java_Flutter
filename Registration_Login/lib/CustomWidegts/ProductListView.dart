import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';
import 'package:resgistration_login/Providers/Product_Provider.dart';



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

    print('This is being build');

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
                                Selector<ProductProvider, int>(
                                  selector: (_, productProvider) => productProvider.productFound[index].availableStock,
                                  builder: (_, availableStock, __) => Text('Available Stocks: $availableStock'),
                                ),
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
      ],
    );
  }
}