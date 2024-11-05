import 'dart:convert';
import 'package:dartz/dartz.dart'; //مشان اعرف مين اليسار ومين اليمين
import 'package:http/http.dart' as http;
import 'package:task6/core/class/check_internet.dart';
import 'package:task6/core/class/statuse_request.dart';

class Crud {
  //وظيفته ربط كل الامور مع بعضها
// فحص حالة الانترنت والستايت ريكوست
  Future<Either<StatuseRequest, Map>> postData(
      String link, Map body, Map<String, String> headers) async {
    try {
      if (await checkInternet()) {
        var responce = await http.post(Uri.parse(link),
            body: jsonEncode(body), headers: headers);
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          //200 ,201 Successful connect to the internet other numbers fail connect to the internet
          Map reponceBody = jsonDecode(responce.body);
          print(reponceBody);
          return Right(reponceBody);
        } else {
          return const Left(StatuseRequest.serverFailure);
        }
      } else {
        return left(StatuseRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatuseRequest.serverFailure);
    }
  }
}
