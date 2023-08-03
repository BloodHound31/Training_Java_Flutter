

class ProductData{

  late String productName;
  late double productPrice;
  late double sellerDiscount;
  late double finalPrice;
  late String sellerName;
  late String productDiscription;
  late String productCategories;

  ProductData({required this.productName, required this.productPrice, required this.sellerDiscount, required this.sellerName, required this.productDiscription, required this.productCategories}){
    finalPrice = calculateFinalPrice(productPrice, sellerDiscount);
  }

  double calculateFinalPrice(double productPrice, double discountPercentage) {
    double discountAmount = productPrice * (discountPercentage / 100);
    double finalPrice = productPrice - discountAmount;
    return finalPrice;
  }




}