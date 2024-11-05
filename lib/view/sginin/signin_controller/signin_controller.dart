// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task6/view/side_menu/sidemenu_controller/sidemenu_controller.dart';

class SgininController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool recovery = true;

  void isrcover() {
    recovery = !recovery;
    update();
  }

  var emaill = '';
  var passwordd = '';

  // Setters to capture email and password
  void setEmail(String email) => emaill = email;
  void setPassword(String password) => passwordd = password;

  Future<void> signInUser() async {
    try {
      final response = await http.post(
        Uri.parse('https://task.focal-x.com/api/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': emaill,
          'password': passwordd,
          'fcm_token': '13|mq795t9EO0OXlE9fLT47CC4fKhcKqvkbTghHhcQS3e0d140d',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["data"]["access_token"] != null) {
          String accessToken = data["data"]["access_token"];

          String userName =
              data["data"]["name"]; // Make sure your API returns the name
          String userEmail =
              data["data"]["email"]; // Ensure email is also returned

          // Update Side Menu Controller
          final sidemenuController = Get.find<SidemenuController>();
          sidemenuController.updateProfileName(userName);

          Get.toNamed('/sidemenu', arguments: emaill);
        } else {
          Get.snackbar('Error', 'Failed to retrieve access token.');
        }
      } else {
        // Handle invalid credentials or other error responses
        Get.snackbar(
            'Error', jsonDecode(response.body)["message"] ?? 'Login failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred: $e');
    }
  }
}
