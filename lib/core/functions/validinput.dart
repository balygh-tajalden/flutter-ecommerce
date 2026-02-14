import 'package:get/get_utils/get_utils.dart';

 String? validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "Not valid Username";
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone";
    }
  }
  if (val.length < min) {
    return " can't be less than $min characters";
  }
  if (val.length > max) {
    return " can't be more than $max characters";
  }
   return null; 
}
