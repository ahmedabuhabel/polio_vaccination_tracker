import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polio_vaccination_tracker/registrar/home_page.dart';
import 'package:polio_vaccination_tracker/supervisor/screens/main_screen.dart';

void main(List<String> args) async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      home: MainScreen(count: 4),
    );
  }
}
