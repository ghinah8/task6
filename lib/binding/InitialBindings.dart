import 'package:get/get.dart';
import 'package:task6/core/class/crud.dart';
import 'package:task6/view/mycart/cart_controller/cart_controller.dart';
import 'package:task6/view/orders/orders_controller/orders_controller.dart';
import 'package:task6/view/profile/profile_controller/profile_controller.dart';
import 'package:task6/view/registerAccount/register_controller/register_controller.dart';
import 'package:task6/view/search/search_controller/search_controller.dart';
import 'package:task6/view/side_menu/sidemenu_controller/sidemenu_controller.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    //لحقن الكونترولرز
    Get.put(Crud());
    Get.put(RegisterController());
    Get.put(CartController());
    Get.put(SidemenuController());
    Get.put(ProfileController());
    Get.put(Searchcontroller());
    Get.put(OrdersController());
  }
}
