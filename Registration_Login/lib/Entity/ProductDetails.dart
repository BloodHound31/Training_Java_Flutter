class ProductDetails{

  String productName;
  int productQuantity;
  int productPrice;
  late int totalProductPrice;
  late int initialQuantity;
  late int initialTotal;

  ProductDetails({required this.productName, required this.productQuantity, required this.productPrice}){
    totalProductPrice = totalPrice(productPrice, productQuantity);
    initialQuantity = productQuantity;
    initialTotal = totalProductPrice;
  }

  int totalPrice(int productPrice, int productQuantity){
    int totalPrice = productPrice * productQuantity;
    return totalPrice;
  }

}