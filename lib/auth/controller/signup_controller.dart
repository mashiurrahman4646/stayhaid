import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/approut.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void signup() {
    // Add signup logic here
    Get.toNamed(AppRoute.signupOtp);
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
