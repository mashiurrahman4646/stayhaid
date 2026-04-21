import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/approut.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  void sendResetLink() {
    // Add logic to send reset link
    Get.toNamed(AppRoute.forgotPasswordOtp);
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
