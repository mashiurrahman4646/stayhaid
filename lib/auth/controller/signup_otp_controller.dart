import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/approut.dart';

class SignupOtpController extends GetxController {
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  void verifyCode() {
    // Add verification logic here if needed
    Get.offAllNamed(AppRoute.login);
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
