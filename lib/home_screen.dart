import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polio_vaccination_tracker/registrar/views/registrar_screen.dart';
import 'package:polio_vaccination_tracker/supervisor/screens/first_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.off(() => RegistrarScreen());
              },
              child: Text('Registrar Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => FirstScreen());
              },
              child: Text('Supervisor Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
