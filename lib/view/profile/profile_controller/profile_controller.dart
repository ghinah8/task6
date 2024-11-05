import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/services/my_services.dart';

class ProfileController extends GetxController {
  var name = '';
  var email = '';
  var password = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void updateName(String newName) => name = newName;
  void updateEmail(String newEmail) => email = newEmail;
  void updatePassword(String newPassword) => password = newPassword;

  @override
  void onInit() {
    super.onInit();

    // Ensure MyServices is available and reload updated data from SharedPreferences
    loadUserData();
    update();
  }

  void loadUserData() {
    final myServices = Get.find<MyServices>();

    // Reload the stored data from SharedPreferences
    name = myServices.name ?? '';
    email = myServices.email ?? '';
    password = myServices.password ?? '';

    // Populate the TextEditingControllers with the loaded data
    nameController.text = name;
    emailController.text = email;
    passwordController.text = password;
  }
}
