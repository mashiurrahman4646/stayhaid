import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/approut.dart';

class ForgotPasswordOtpController extends GetxController {
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void verifyCode() {
    // Add verification logic
    Get.toNamed(AppRoute.createNewPassword);
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
