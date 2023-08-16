class ProductDetails{

  String productName;
  int productQuantity;
  int productPrice;
  late int totalProductPrice;
  late int initialQuantity;
  late int initialTotal;
  //late int totalAmount;

  ProductDetails({required this.productName, required this.productQuantity, required this.productPrice}){
    totalProductPrice = totalPrice(productPrice, productQuantity);
    initialQuantity = productQuantity;
    initialTotal = totalProductPrice;
  }

  int totalPrice(int productPrice, int productQuantity){
    int totalPrice = productPrice * productQuantity;
    return totalPrice;
  }

  void decreaseProduct(){
    if(productQuantity > 0){
      productQuantity -= 1;
      totalProductPrice = totalPrice(productPrice, productQuantity);
    }
  }

  void increaseProduct(){
    if(productQuantity < initialQuantity){
      productQuantity += 1;
      totalProductPrice = totalPrice(productPrice, productQuantity);
    }
  }

  void goToDefault(){
    productQuantity = initialQuantity;
    totalProductPrice = initialTotal;
  }

  void updateSummary(){
    initialQuantity = productQuantity;
    initialTotal = totalProductPrice;
  }



}