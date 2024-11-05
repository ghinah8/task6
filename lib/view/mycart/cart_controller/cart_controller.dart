import 'package:get/get.dart';

class CartController extends GetxController {
  // List of products with their quantities
  double sum = 0;
  double deliveryCost = 60.20;

  List<Map<String, dynamic>> products = [
    {
      'image': 'image 14 (1).png',
      'imageprice': '74.95',
      'imagename': 'Programmer T-shirt',
      'count': 1
    },
    {
      'image': 'image 13.png',
      'imageprice': '94.05',
      'imagename': 'Programmer T-shirt',
      'count': 1
    },
    {
      'image': 'image 12.png',
      'imageprice': '584.95',
      'imagename': 'Programmer T-shirt',
      'count': 1
    },
  ];

  // Method to increment the count of a specific product
  void inc(int index) {
    products[index]['count']++;
    calculateTotal();
  }

  void dec(int index) {
    if (products[index]['count'] > 1) {
      products[index]['count']--;
      calculateTotal();
    }
  }

  void deleteProduct(int index) {
    products.removeAt(index);
    calculateTotal();
  }

  void calculateTotal() {
    sum = products.fold(0.0, (total, product) {
      return total + (product['count'] * double.parse(product['imageprice']));
    });
    update();
  }

  double calculateTotalWithDelivery() {
    return sum + deliveryCost;
  }
}
