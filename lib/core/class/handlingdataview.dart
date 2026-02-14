import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/imagasset.dart';
import 'package:lottie/lottie.dart';

// كلاس للتحكم في عرض الواجهة بناءً على حالة البيانات (تحميل، خطأ، لا يوجد إنترنت)
class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading, width: 250,height: 250))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250,height: 250))
        : statusRequest == StatusRequest.failure
        ? Center(child: Lottie.asset(AppImageAsset.noData, width: 250,height: 250, repeat: false))
        : statusRequest == StatusRequest.serverFailure
        ? Center(child: Lottie.asset(AppImageAsset.server, width: 250,height: 250))
        : widget;
  }
}


// كلاس للتحكم في الطلبات البرمجية وعرض رسوم التحميل أو الخطأ أثناء جلب البيانات
class HandlingDataRequest extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading, width: 250,height: 250))
        : statusRequest == StatusRequest.offlineFailure
        ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250,height: 250))
        : statusRequest == StatusRequest.failure
        ?  Center(child: Lottie.asset(AppImageAsset.server, width: 250,height: 250))
        : widget;
  }
}
