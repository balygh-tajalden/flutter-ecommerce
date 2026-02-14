import 'package:get/get.dart';

abstract class BottomNavController extends GetxController {
  void setIndex(int index);
}

class BottomNavControllerImp extends BottomNavController {
  var currentIndex = 0.obs;

  @override
  void setIndex(int index) {
    currentIndex.value = index;
  }
}
