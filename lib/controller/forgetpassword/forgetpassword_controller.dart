import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/auth_validate.dart';
import 'package:flutter_application_1/core/functions/custom_dialog.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController with AuthValidation{
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  StatusRequest? statusRequest;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response["data"]);
          Get.offNamed(AppRoutes.verifyCode, arguments: {"email": email.text});
        } else {
          customSnackbar("42".tr, "Email Not Found");
          statusRequest = StatusRequest.none; // إعادة الحالة للوضع الطبيعي لإظهار الواجهة مجدداً
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
