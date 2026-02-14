import 'package:flutter_application_1/core/class/statusrequest.dart';

  handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
