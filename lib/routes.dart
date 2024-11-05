import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task6/view/mycart/cart_screen/cart_screen.dart';
import 'package:task6/view/profile/profile_screen/profile_screen.dart';
import 'package:task6/view/registerAccount/register_screen/register_Screen.dart';
import 'package:task6/view/search/search_screen/search_screen.dart';
import 'package:task6/view/sginin/sginin_Screen/signin_Screen.dart';
import 'package:task6/view/side_menu/sidemenu_screen/sidemenu_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/sgininscreen', page: () => SigninScreen()),
  GetPage(name: '/registerscreen', page: () => RegisterScreen()),
  GetPage(name: '/cartscreen', page: () => CartScreen()),
  GetPage(name: '/profilescreen', page: () => const ProfileScreen()),
  GetPage(name: '/searchscreen', page: () => const SearchScreen()),
  GetPage(name: '/sidemenu', page: () => const SidemenuScreen()),
];
