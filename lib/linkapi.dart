class AppLink {
  static const String server = "https://balygh.com/dashboard/api";
  static const String imagestatic = "https://balygh.com/dashboard/upload";
  static const String imageCategory = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";
  static const String imageUser = "$imagestatic/users";

  //tests
  static const String test = "$server/test";

  //====================== Auth ======================//
  static const String login = "$server/auth/login";
  static const String signUp = "$server/auth/signup";
  static const String verifyCodeSignUp = "$server/auth/verfiycode";

  //====================== Forget Password ======================//

  static const String checkemail = "$server/forgetpassword/checkemail";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword";
      
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode";


  //====================== Home ======================//
  static const String homePage = "$server/home";

  //====================== Users ======================//
  static const String getUserData = "$server/users";


  //====================== Cart ======================//
  static const String getCartData = "$server/cart/getcartdata";
  static const String addCart = "$server/cart/add";
  static const String deleteCart = "$server/cart/delete";
  static const String getCountItemsCart = "$server/cart/getcountitems";

  //====================== Chat ======================//
  static const String chatUpload = "$server/chat/upload";

}
