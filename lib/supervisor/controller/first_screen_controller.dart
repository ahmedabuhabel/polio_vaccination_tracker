import 'package:get/get_state_manager/get_state_manager.dart';

class FirstScreenController extends GetxController {
  int count = 0;
  void increament() {
    count++;
    update();
  }

  void decreament() {
    if (count > 0) {
      count--;
    }
    update();
  }
}
