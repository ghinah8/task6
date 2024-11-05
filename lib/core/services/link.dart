//connect to api

import 'package:task6/core/const_data/const_data.dart';

class AppLink {
  //remote address
  static String approot = 'https://';

  static String serverApiroot = '$approot/task.focal-x.com/api  ';

  static String login = '$serverApiroot/login';
  static String logout = '$serverApiroot/logout';

  static String home = '$serverApiroot/register';
  static String order = '$serverApiroot/order';

  Map<String, String> getHeader() {
    Map<String, String> mainheader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
    return mainheader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainheader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Brearer${ConstData.istoken}"
    };
    return mainheader;
  }
}
