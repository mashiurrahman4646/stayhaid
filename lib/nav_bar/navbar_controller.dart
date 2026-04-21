import 'package:get/get.dart';
import '../home/presentation/home_screen.dart';
import '../track/presentation/track_screen.dart';
import '../miranda/presentation/miranda_screen.dart';
import '../meds/presentation/meds_screen.dart';
import '../profile/presentation/profile_screen.dart';

class NavbarController extends GetxController {
  var selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const TrackScreen(),
    const MirandaScreen(),
    const MedsScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
