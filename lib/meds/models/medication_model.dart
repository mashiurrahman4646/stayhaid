import 'package:flutter/material.dart';

enum MedicationType {
  estrogen,
  hormone,
  supplement,
  other;

  String get displayName {
    switch (this) {
      case MedicationType.estrogen:
        return 'Estrogen';
      case MedicationType.hormone:
        return 'Hormone';
      case MedicationType.supplement:
        return 'Supplement';
      case MedicationType.other:
        return 'Other';
    }
  }

  Color get color {
    switch (this) {
      case MedicationType.estrogen:
        return const Color(0xFFFFEBEB);
      case MedicationType.hormone:
        return const Color(0xFFF3E8FF);
      case MedicationType.supplement:
        return const Color(0xFFFFFBEB);
      case MedicationType.other:
        return const Color(0xFFF3F4F6);
    }
  }

  Color get textColor {
    switch (this) {
      case MedicationType.estrogen:
        return const Color(0xFFD69785);
      case MedicationType.hormone:
        return const Color(0xFF9333EA);
      case MedicationType.supplement:
        return const Color(0xFFD97706);
      case MedicationType.other:
        return const Color(0xFF4B5563);
    }
  }
}

class Medication {
  final String id;
  final String name;
  final String dosage;
  final MedicationType type;
  final String iconPath;
  final List<TimeOfDay> dosingTimes;
  final Color themeColor;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.type,
    required this.iconPath,
    required this.dosingTimes,
    required this.themeColor,
  });
}

class MedicationRecord {
  final String id;
  final String medicationId;
  final String medicationName;
  final String dosage;
  final DateTime scheduledTime;
  final DateTime takenTime;
  final bool isTaken;

  MedicationRecord({
    required this.id,
    required this.medicationId,
    required this.medicationName,
    required this.dosage,
    required this.scheduledTime,
    required this.takenTime,
    this.isTaken = true,
  });
}
