import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/middleware/mymiddleware.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/login.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/signup.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/success_signup.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:flutter_application_1/view/screen/auth/verifycodesignup.dart';
import 'package:flutter_application_1/view/screen/cart.dart';
import 'package:flutter_application_1/view/screen/homepage.dart';
import 'package:flutter_application_1/view/screen/language.dart';
import 'package:flutter_application_1/view/screen/mainpage.dart';
import 'package:flutter_application_1/view/screen/onboarding.dart';
import 'package:flutter_application_1/view/screen/product_details.dart';
import 'package:flutter_application_1/view/screen/profile.dart';
import 'package:flutter_application_1/view/screen/chat_screen.dart';
import 'package:flutter_application_1/view/screen/users_list.dart';
import 'package:flutter_application_1/view/widget/splashscreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // Initial Page
  GetPage(name: "/", page: () => const Language(), middlewares: [
    MyMiddleware()
  ]),
  
  // Auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signUP, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.verifycodesignup, page: () => const VerifyCodeSignUp()),
  
  // OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  // Home
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),

  // MainPage
  GetPage(name: AppRoutes.mainPage, page: () => const MainPage()),

  // Profile
  GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),

  // Language
  GetPage(name: AppRoutes.language, page: () => const Language()),

  // SplashScreen
  GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),

  // Cart
  GetPage(name: AppRoutes.cart, page: () => const CartPage()),

  // Product Details
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),

  // Chat
  GetPage(name: AppRoutes.chat, page: () => const ChatScreen()),

  // Users List
  GetPage(name: AppRoutes.usersList, page: () => const UsersList()),
];
