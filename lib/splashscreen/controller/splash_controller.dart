import 'package:get/get.dart';
import '../../core/approut.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Wait for 3 seconds before navigating
    await Future.delayed(const Duration(seconds: 3));
    
    // Navigate to the onboarding screen
    Get.offAllNamed(AppRoute.onboarding);
  }
}
