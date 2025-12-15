import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polio_vaccination_tracker/supervisor/constants.dart';
import 'package:polio_vaccination_tracker/supervisor/controller/first_screen_controller.dart';
import 'package:polio_vaccination_tracker/supervisor/screens/supervisor_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final controller = Get.put(FirstScreenController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'اختار عدد الفرق',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 48),
              GetBuilder<FirstScreenController>(
                init: FirstScreenController(),
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.increament();
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 48,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        controller.count.toString(),
                        style: const TextStyle(
                          fontSize: 36,
                          color: kPrimaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.decreament();
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 48,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                onPressed: () {
                  Get.to(() => SupervisorScreen(count: controller.count));
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'التالي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
