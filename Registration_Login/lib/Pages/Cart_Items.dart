import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resgistration_login/Providers/Cart_Provider.dart';

class CartItemsPage extends StatefulWidget {
  const CartItemsPage({super.key});

  @override
  State<CartItemsPage> createState() => _CartItemsPageState();
}

class _CartItemsPageState extends State<CartItemsPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);

    //final product = cart.product;

    return Scaffold(
      backgroundColor: Color(0xFF293770),
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
        backgroundColor: Color(0xFF293771),
      ),
      body: Column(
        children: [
          Expanded(
            //flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cart.items.values.toList()[index];
                  final product = cartItem.product;

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Color(0xFF8C9BDA),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        title: Text(
                          cart.items.values.toList()[index].productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price ${cart.items.values.toList()[index].productPrice}',
                            ),
                            SizedBox(height: 5),
                            Text(
                                'discount: ${cart.items.values.toList()[index].discountPercent}%'),
                            SizedBox(height: 5),
                            Text(
                                'Quantity: ${cart.items.values.toList()[index].productQuantity}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color(0xFF293771),
                                  child: IconButton(
                                      onPressed: () {
                                        cart.addItems(
                                            product: cart.items.values
                                                .toList()[index]
                                                .product);
                                        product.DecreaseStocks();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 18,
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 18,
                                  child: IconButton(
                                      onPressed: () {
                                        cart.subtractItems(
                                            product: cart.items.values
                                                .toList()[index]
                                                .product);
                                        product.IncreaseStocks();
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        size: 18,
                                      )),
                                  backgroundColor: Color(0xFF293771),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xFF8B9AD8),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Total Amount: ${cart.TotalPrice}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 1000,
                            height: 80,
                            padding: EdgeInsets.all(10),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // cart.items.clear();
                                if (cart.items.isNotEmpty) {
                                  Navigator.pushNamed(context, '/Checkout',
                                      arguments: {
                                        'totalDiscount': cart.totalDiscount,
                                        'totalPrice': cart.TotalPrice,
                                        'cartItems': cart.items
                                      });
                                } else {
                                  //Throw a toast
                                  print('error: no item found');
                                }
                              },
                              icon: Icon(Icons.check_outlined),
                              label: Text(
                                'Proceed To Check Out',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF293771)),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
