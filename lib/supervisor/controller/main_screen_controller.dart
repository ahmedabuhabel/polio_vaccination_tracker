import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamsController extends GetxController {
  var childrenUnder5Controllers = <TextEditingController>[].obs;
  var newBornControllers = <TextEditingController>[].obs;
  var childrenOver5Controllers = <TextEditingController>[].obs;
  var recievedBottlesController = <TextEditingController>[].obs;
  var usedBottlesControllers = <TextEditingController>[].obs;
  var unusedBottlesControllers = <TextEditingController>[].obs;
  var returnedBottlesControllers = <TextEditingController>[].obs;
  void clearAllFields() {
    newBornControllers.clear();
    childrenUnder5Controllers.clear();
    childrenOver5Controllers.clear();
    recievedBottlesController.clear();
    usedBottlesControllers.clear();
    unusedBottlesControllers.clear();
    returnedBottlesControllers.clear();
  }

  void initializeControllers(int count) {
    for (int i = 0; i < count; i++) {
      childrenUnder5Controllers.add(TextEditingController());
      newBornControllers.add(TextEditingController());
      childrenOver5Controllers.add(TextEditingController());
      recievedBottlesController.add(TextEditingController());
      usedBottlesControllers.add(TextEditingController());
      unusedBottlesControllers.add(TextEditingController());
      returnedBottlesControllers.add(TextEditingController());
    }
  }

  int calculateSum(List<TextEditingController> controllers) {
    int sum = 0;
    for (var controller in controllers) {
      sum += int.tryParse(controller.text) ?? 0;
    }
    return sum;
  }

  int calculateTotalChildren() {
    int totalUnder5 = calculateSum(childrenUnder5Controllers);
    int totalNewBorn = calculateSum(newBornControllers);
    int totalOver5 = calculateSum(childrenOver5Controllers);
    return totalUnder5 + totalOver5 + totalNewBorn;
  }

  void disposeControllers() {
    for (var controller in newBornControllers) {
      controller.dispose();
    }
    for (var controller in childrenUnder5Controllers) {
      controller.dispose();
    }
    for (var controller in childrenOver5Controllers) {
      controller.dispose();
    }
    for (var controller in recievedBottlesController) {
      controller.dispose();
    }
    for (var controller in usedBottlesControllers) {
      controller.dispose();
    }
    for (var controller in unusedBottlesControllers) {
      controller.dispose();
    }
    for (var controller in returnedBottlesControllers) {
      controller.dispose();
    }
  }
}
