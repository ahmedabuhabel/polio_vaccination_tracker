import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polio_vaccination_tracker/registrar/info_page.dart';
import 'package:polio_vaccination_tracker/supervisor/constants.dart';

import '../controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  final int count;

  MainScreen({super.key, required this.count});

  final TeamsController teamsController = Get.put(TeamsController());

  @override
  Widget build(BuildContext context) {
    teamsController.initializeControllers(count);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                buttonColor: Colors.blue[900],
                onConfirm: () {
                  teamsController.clearAllFields();
                  Get.back();
                },
                textConfirm: 'نعم',
                textCancel: 'لا',
                title: 'تصفير المحتوى',
                content: const Text(
                  'هل أنت متاكد انك تريد حذف جميع الاحصائيات؟',
                ),
              );
            },
            icon: const Icon(Icons.clear, color: Colors.white, size: 32),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => const InfoScreen());
            },
            icon: const Icon(Icons.info, color: Colors.white, size: 32),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          'عدد الفرق: $count',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Teams(
                      newBornController:
                          teamsController.newBornControllers[index],
                      index: index,
                      childrenUnder5Controller:
                          teamsController.childrenUnder5Controllers[index],
                      childrenOver5Controller:
                          teamsController.childrenOver5Controllers[index],
                      recievedBottlesController:
                          teamsController.recievedBottlesController[index],
                      usedBottlesController:
                          teamsController.usedBottlesControllers[index],
                      unusedBottlesController:
                          teamsController.unusedBottlesControllers[index],
                      returnedBottlesControllers:
                          teamsController.returnedBottlesControllers[index],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    final newBornSum = teamsController.calculateSum(
                      teamsController.newBornControllers,
                    );
                    final childrenUnder5Sum = teamsController.calculateSum(
                      teamsController.childrenUnder5Controllers,
                    );
                    final childrenOver5Sum = teamsController.calculateSum(
                      teamsController.childrenOver5Controllers,
                    );
                    final bottlesSum = teamsController.calculateSum(
                      teamsController.recievedBottlesController,
                    );
                    final totalChildren = teamsController
                        .calculateTotalChildren();
                    final totalUsedBottles = teamsController.calculateSum(
                      teamsController.usedBottlesControllers,
                    );
                    final totalUnusedBottles = teamsController.calculateSum(
                      teamsController.unusedBottlesControllers,
                    );
                    final totalReturnedBottles = teamsController.calculateSum(
                      teamsController.returnedBottlesControllers,
                    );
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'مجموع البيانات',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'أطفال <1: $newBornSum\n'
                          'أطفال <5: $childrenUnder5Sum\n'
                          'أطفال >5: $childrenOver5Sum\n'
                          'المجموع الكلي للأطفال: $totalChildren\n'
                          'قارورات: $bottlesSum\n'
                          'قارورات مستخدمة: $totalUsedBottles\n'
                          'قارورات غير مستخدمة: $totalUnusedBottles\n'
                          'قارورات مرجعة: $totalReturnedBottles',
                          style: const TextStyle(fontSize: 24),
                        ),
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              child: const Text(
                                'حسناً',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'عرض النتيجة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class Teams extends StatelessWidget {
  const Teams({
    super.key,
    required this.index,
    required this.childrenUnder5Controller,
    required this.childrenOver5Controller,
    required this.recievedBottlesController,
    required this.usedBottlesController,
    required this.unusedBottlesController,
    required this.returnedBottlesControllers,
    required this.newBornController,
  });

  final int index;
  final TextEditingController newBornController;
  final TextEditingController childrenUnder5Controller;
  final TextEditingController childrenOver5Controller;
  final TextEditingController recievedBottlesController;
  final TextEditingController usedBottlesController;
  final TextEditingController unusedBottlesController;
  final TextEditingController returnedBottlesControllers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'فريق رقم ${index + 1}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            const Text('أطفال <1', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: newBornController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            const Text('أطفال <5', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: childrenUnder5Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            const Text('أطفال >5', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: childrenOver5Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            const Text('قارورات', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: recievedBottlesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
        const Text(
          'حالة القارورات',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            const Text('مستخدمة', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: usedBottlesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            const Text('غير مستخدمة', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: unusedBottlesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 8),
            const Text('مرجع', style: TextStyle(fontSize: 18)),
            Expanded(
              child: TextField(
                controller: returnedBottlesControllers,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
