import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/medication_model.dart';

class MedsController extends GetxController {
  var selectedTab = 0.obs;
  
  var medications = <Medication>[
    Medication(
      id: '1',
      name: 'Progesterone',
      dosage: '100mg',
      type: MedicationType.hormone,
      iconPath: 'assets/icons/Progesterone.png',
      dosingTimes: [const TimeOfDay(hour: 22, minute: 0)],
      themeColor: const Color(0xFF9333EA),
    ),
    Medication(
      id: '2',
      name: 'Estradiol',
      dosage: '2mg',
      type: MedicationType.estrogen,
      iconPath: 'assets/icons/Estradiol (2mg).png',
      dosingTimes: [const TimeOfDay(hour: 8, minute: 0)],
      themeColor: const Color(0xFFD69785),
    ),
    Medication(
      id: '3',
      name: 'Estradiol',
      dosage: '2mg',
      type: MedicationType.estrogen,
      iconPath: 'assets/icons/Estradiol.png',
      dosingTimes: [const TimeOfDay(hour: 20, minute: 0)],
      themeColor: const Color(0xFFD69785),
    ),
    Medication(
      id: '4',
      name: 'Vitamin D3',
      dosage: '2000 IU',
      type: MedicationType.supplement,
      iconPath: 'assets/icons/VitaminD3.png',
      dosingTimes: [const TimeOfDay(hour: 9, minute: 0)],
      themeColor: const Color(0xFFD97706),
    ),
  ].obs;

  var history = <DateTime, List<MedicationRecord>>{
    DateTime(2026, 3, 16): [
      MedicationRecord(
        id: 'h1',
        medicationId: '1',
        medicationName: 'Estradiol',
        dosage: '2mg',
        scheduledTime: DateTime(2026, 3, 16, 8, 0),
        takenTime: DateTime(2026, 3, 16, 8, 2),
      ),
      MedicationRecord(
        id: 'h2',
        medicationId: '3',
        medicationName: 'Vitamin D3',
        dosage: '2000 IU',
        scheduledTime: DateTime(2026, 3, 16, 9, 0),
        takenTime: DateTime(2026, 3, 16, 9, 15),
      ),
      MedicationRecord(
        id: 'h3',
        medicationId: '2',
        medicationName: 'Progesterone',
        dosage: '100mg',
        scheduledTime: DateTime(2026, 3, 16, 20, 0),
        takenTime: DateTime(2026, 3, 16, 20, 0),
      ),
    ],
    DateTime(2026, 3, 17): [
       MedicationRecord(
        id: 'h4',
        medicationId: '1',
        medicationName: 'Estradiol',
        dosage: '2mg',
        scheduledTime: DateTime(2026, 3, 17, 8, 0),
        takenTime: DateTime(2026, 3, 17, 8, 5),
      ),
    ]
  }.obs;

  var todayRecords = <String, bool>{
    '1_10:00 PM': true,
    '2_08:00 AM': false,
    '3_08:00 PM': true,
    '4_09:00 AM': true,
  }.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void markAsTaken(String key) {
    todayRecords[key] = true;
  }
}
