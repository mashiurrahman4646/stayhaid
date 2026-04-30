import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final messageController = TextEditingController();

  // মেসেজ লিস্ট (নমুনা ডাটা সহ)
  var messages = <Map<String, dynamic>>[
    {'text': 'Hi! How can I help you?', 'isMe': false, 'time': '2:34 PM'},
  ].obs;

  void sendMessage() {
    if (messageController.text
        .trim()
        .isNotEmpty) {
      messages.add({
        'text': messageController.text.trim(),
        'isMe': true,
        'time': '2:40 PM', // আপনি চাইলে এখানে Real Time যোগ করতে পারেন
      });
      messageController.clear();
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}