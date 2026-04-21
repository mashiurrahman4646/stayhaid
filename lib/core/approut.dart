import 'package:get/get.dart';
import '../auth/presentation/login/loginin.dart';
import '../auth/presentation/signup/signup.dart';
import '../auth/presentation/signup/signupotppage.dart';
import '../auth/presentation/forgetpassword/forgetpasswordemailsubmit.dart';
import '../auth/presentation/forgetpassword/forgetpasswordotpscreen.dart';
import '../auth/presentation/forgetpassword/createnewpassword.dart';
import '../nav_bar/navbar_ui.dart';

import '../onbording/presentation/onbording_screen.dart';
import '../splashscreen/presentation/splash_screen.dart';

class AppRoute {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String signupOtp = '/signupOtp';
  static const String forgotPassword = '/forgotPassword';
  static const String forgotPasswordOtp = '/forgotPasswordOtp';
  static const String createNewPassword = '/createNewPassword';
  static const String navbar = '/navbar';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnbordingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    GetPage(name: signupOtp, page: () => const SignupOtpPage()),
    GetPage(name: forgotPassword, page: () => const ForgotPasswordEmailSubmitScreen()),
    GetPage(name: forgotPasswordOtp, page: () => const ForgotPasswordOtpScreen()),
    GetPage(name: createNewPassword, page: () => const CreateNewPasswordScreen()),
    GetPage(name: navbar, page: () => const NavbarUi()),
  ];
}
