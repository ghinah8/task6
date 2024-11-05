import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  String? get name => sharedPreferences.getString('name');
  String? get email => sharedPreferences.getString('email');
  String? get password => sharedPreferences.getString('password');
}

void savedata(String name, String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('email', email);
  prefs.setString('password', password);
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}



// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyServices extends GetxService {
//   late SharedPreferences sharedPreferences;
//   String? name;
//   String? email;
//   String? password;

//   Future<MyServices> init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     name = sharedPreferences.getString('name');
//     email = sharedPreferences.getString('email');
//     password = sharedPreferences.getString('password');

//     return this; //لانو رح اعيد متغيرات نفس نوع الكلاس
//   } //يكون فيها قيم التوكين مثل الاز لوغ ان
// }

// void savedata(String name, String email, String password) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('name', name);
//   prefs.setString('email', email);
//   prefs.setString('password', password);
// }

// initialServices() async {
//   await Get.putAsync(() => MyServices().init());
// }//عملية حقن الكلاس نفسه
// //لكل حالة تغير في الماي سيرفيسز يعمل حقن او  متل تحديث

