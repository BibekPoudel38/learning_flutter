import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkTheme = false;

  toggleTheme() {
    isDarkTheme = !isDarkTheme;
    update();
  }
}
