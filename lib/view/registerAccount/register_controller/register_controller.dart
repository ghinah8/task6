// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task6/core/services/my_services.dart';
import 'dart:convert';

import 'package:task6/view/side_menu/sidemenu_controller/sidemenu_controller.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool recovery = true;

  void isrcover() {
    recovery = !recovery;
    update();
  }

  // Store input values
  String name = '';
  String email = '';
  String password = '';

  // Setters for input fields
  void setName(String value) => name = value;
  void setEmail(String value) => email = value;
  void setPassword(String value) => password = value;

  Future<void> registerUser() async {
    try {
      final response = await http.post(
        Uri.parse('https://task.focal-x.com/api/register'),
        headers: {'Accept': 'application/json'},
        body: {
          'name': name,
          'email': email,
          'password': password,
          'fcm_token': '13|mq795t9EO0OXlE9fLT47CC4fKhcKqvkbTghHhcQS3e0d140d',
        },
      );
      Get.toNamed('/sidemenu');
      update();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String accessToken = data["data"]["access_token"];

        // Save the user's name, email, and password to SharedPreferences
        savedata(
            name, email, password); // Ensure new registration data is saved

        // Update profile name in the side menu
        Get.find<SidemenuController>().updateProfileName(name);

        Get.snackbar('Success', 'Account created successfully!');
      } else {
        Get.snackbar('Error',
            jsonDecode(response.body)["message"] ?? 'Registration failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    }
  }

  @override
  void onInit() {
    MyServices();
    super.onInit();
  }
}
