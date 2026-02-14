import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  // دالة لإرسال البيانات إلى السيرفر (POST Request) والتحقق من الاتصال بالإنترنت
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        print("POST URL: $linkurl");
        var response = await http.post(Uri.parse(linkurl), body: data);
        print("Response: ${response.body}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return Left(StatusRequest.serverException);
    }
  }
}
