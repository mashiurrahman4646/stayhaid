import 'package:get/get.dart';

class TrackController extends GetxController {
  var activeTab = 0.obs; // 0: Log Today, 1: Trends
  
  // Log Today State
  var selectedHotFlash = 0.obs;
  var selectedNightSweat = 0.obs;
  var sleepQuality = 5.0.obs;
  var selectedMood = 1.obs; // 0: Low, 1: Okay, 2: Good
  var brainFog = 5.0.obs;
  var energyLevel = 5.0.obs;

  void changeTab(int index) {
    activeTab.value = index;
  }

  void updateHotFlash(int val) => selectedHotFlash.value = val;
  void updateNightSweat(int val) => selectedNightSweat.value = val;
  void updateSleepQuality(double val) => sleepQuality.value = val;
  void updateMood(int val) => selectedMood.value = val;
  void updateBrainFog(double val) => brainFog.value = val;
  void updateEnergyLevel(double val) => energyLevel.value = val;
}
