import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SidemenuController extends GetxController {
  String profileName = '';

  void updateProfileName(String newName) {
    profileName = newName;
    update();
  }

  Future<void> logoutUser() async {
    try {
      final response = await http.post(
        Uri.parse('https://task.focal-x.com/api/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer 840|y2PH5txKskiN5ZDZvDktD2j0qocIGWBl1yznyKkZbb2a6273',
        },
        body: {
          "massage": "user logout successful",
          'fcm_token': '840|y2PH5txKskiN5ZDZvDktD2j0qocIGWBl1yznyKkZbb2a6273',
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar('Logout', data["message"] ?? 'User logout successful');
        Get.toNamed('/sgininscreen'); // Navigate to login screen after logout
        update();
      } else {
        Get.snackbar('Error', data["message"] ?? 'Logout failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'Log Out Failed: $e');
    }
  }
}
