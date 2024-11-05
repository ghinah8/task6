import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/view/orders/orders_controller/orders_controller.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize responsive settings
    Responsive.responsive(context);

    return Scaffold(
      backgroundColor: ColorsApp.textfieldcolor,
      appBar: AppBar(
        backgroundColor: ColorsApp.textfieldcolor,
        title: Center(
          child: Text(
            'Orders',
            style: FontStyles.textStylemycarttitle.copyWith(
              fontSize: 24 * Responsive.responsiveWidth, // Adjust font size
            ),
          ),
        ),
      ),
      body: GetBuilder<OrdersController>(
        builder: (controller) {
          if (controller.orderList.isEmpty) {
            return Center(
              child: Text(
                'No orders found.',
                style: TextStyle(
                  fontSize: 18 * Responsive.responsiveWidth, // Adjust font size
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.orderList.length,
            itemBuilder: (context, index) {
              final order = controller.orderList[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      15 * Responsive.responsiveWidth, // Responsive padding
                  vertical: 8 * Responsive.responsiveHeight,
                ),
                child: ListTile(
                  title: Text(
                    order.productName,
                    style: TextStyle(
                      fontSize: 16 *
                          Responsive.responsiveWidth, // Responsive text size
                    ),
                  ),
                  subtitle: Text(
                    'Quantity: ${order.quantity}',
                    style: TextStyle(
                      fontSize: 14 *
                          Responsive.responsiveWidth, // Responsive text size
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: ColorsApp.deletebutton,
                      size: 24 *
                          Responsive.responsiveWidth, // Responsive icon size
                    ),
                    onPressed: () => controller.deleteOrder(order.id),
                  ),
                  onTap: () => controller.updateOrder(
                      order.id, order.id, order.quantity + 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
