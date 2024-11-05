import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task6/model/order_model.dart';

class OrdersController extends GetxController {
  var orderList = <OrderModel>[];
  final String baseUrl = 'https://task.focal-x.com/api/orders';
  final String token = '840|y2PH5txKskiN5ZDZvDktD2j0qocIGWBl1yznyKkZbb2a6273';

  Future<void> fetchOrders() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['data'];
      orderList = data.map((e) => OrderModel.fromJson(e)).toList();
    }
  }

  Future<void> createOrder(int productId, int quantity) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {
        'product_id': productId.toString(),
        'quantity': quantity.toString()
      },
    );
    if (response.statusCode == 201) {
      fetchOrders();
    }
  }

  Future<void> updateOrder(int orderId, int productId, int quantity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$orderId'),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
      body: {
        'product_id': productId.toString(),
        'quantity': quantity.toString()
      },
    );
    if (response.statusCode == 200) {
      fetchOrders();
    }
  }

  Future<void> deleteOrder(int orderId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$orderId'),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      fetchOrders();
    }
  }
}
