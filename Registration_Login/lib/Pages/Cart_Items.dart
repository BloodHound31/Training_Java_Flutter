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
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
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
                      child: ListTile(
                        title: Text(cart.items.values.toList()[index].productName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Price ${cart.items.values.toList()[index]
                                    .productPrice}'),
                            SizedBox(height: 5),
                            Text(
                                'Quantity: ${cart.items.values.toList()[index]
                                    .productQuantity}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      cart.addItems(
                                          product: cart.items.values
                                              .toList()[index]
                                              .product);
                                      product.DecreaseStocks();
                                    },
                                    icon: Icon(Icons.add)),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      cart.subtractItems(
                                          product: cart.items.values
                                              .toList()[index]
                                              .product);
                                      product.IncreaseStocks();
                                    },
                                    icon: Icon(Icons.minimize)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                },
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20,),
              child:Text('Total Amount: ${cart.TotalPrice}')
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/Checkout',  arguments: cart.items.values.toList(),);
                },
                icon: Icon(Icons.check_outlined),
                label: Text('Proceed To Check Out')),
          ),
        ],
      ),
    );
  }
}
