import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/binding/InitialBindings.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/core/services/my_services.dart';
import 'package:task6/core/services/routes.dart';
import 'package:task6/routes.dart';
import 'package:task6/view/mycart/cart_screen/cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyServices();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.responsive(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
      getPages: routes,
      initialBinding: Initialbindings(),
      initialRoute: Routes.register,
    );
  }
}
