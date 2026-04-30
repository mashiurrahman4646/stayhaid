import 'package:get/get.dart';
import '../auth/presentation/login/loginin.dart';
import '../auth/presentation/signup/signup.dart';
import '../auth/presentation/signup/signupotppage.dart';
import '../auth/presentation/forgetpassword/forgetpasswordemailsubmit.dart';
import '../auth/presentation/forgetpassword/forgetpasswordotpscreen.dart';
import '../auth/presentation/forgetpassword/createnewpassword.dart';
import '../home/presentation/notificationui.dart';
import '../nav_bar/navbar_ui.dart';
import '../profile/presentation/editprofile.dart';
import '../profile/presentation/privacy and policy.dart';
import '../profile/presentation/terms and conditions.dart';
import '../profile/presentation/help and support.dart';
import '../profile/presentation/chat with us.dart';
import '../profile/presentation/email support.dart';


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
  static const String editProfile = '/editProfile';
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsConditions = '/termsConditions';
  static const String helpSupport = '/helpSupport';
  static const String chatSupport = '/chatSupport';
  static const String emailSupport = '/emailSupport';
  static const String notifications = '/notifications';

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
    GetPage(name: editProfile, page: () => const EditProfileScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsConditions, page: () => const TermsConditionsScreen()),
    GetPage(name: helpSupport, page: () => const HelpSupportScreen()),
    GetPage(name: chatSupport, page: () => const ChatWithUsScreen()),
    GetPage(name: emailSupport, page: () => const EmailSupportScreen()),
    GetPage(name: notifications, page: () => const NotificationsScreen()),
  ];
}
