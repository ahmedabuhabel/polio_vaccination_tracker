import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/total_bottle_list_tile.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/total_list_tile.dart';
import '../controller/teams_controller.dart';

class SupervisorScreen extends StatelessWidget {
  final int count;
  SupervisorScreen({super.key, required this.count});

  final TeamsController teamsController = Get.put(TeamsController());

  @override
  Widget build(BuildContext context) {
    teamsController.initializeControllers(count);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'عدد الفرق: $count',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: Get.back,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Get.defaultDialog(
                title: 'تصفير المحتوى',
                titleStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                middleText: 'هل أنت متاكد انك تريد حذف جميع الاحصائيات؟',
                textConfirm: 'نعم',
                textCancel: 'لا',
                confirmTextColor: Colors.white,
                buttonColor: Colors.deepPurple,
                onConfirm: () {
                  teamsController.clearAllFields();
                  Get.back();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.summarize, color: Colors.white),
            tooltip: 'عرض المجموع',
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
              final totalChildren = teamsController.calculateTotalChildren();
              final totalUsedBottles = teamsController.calculateSum(
                teamsController.usedBottlesControllers,
              );
              final totalUnusedBottles = teamsController.calculateSum(
                teamsController.unusedBottlesControllers,
              );
              final totalReturnedBottles = teamsController.calculateSum(
                teamsController.returnedBottlesControllers,
              );
              Get.defaultDialog(
                title: '📊 المجموع',
                titleStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                onConfirm: () => Get.back(),
                textConfirm: 'تم',
                confirmTextColor: Colors.white,
                buttonColor: Colors.deepPurple[700],
                content: Column(
                  children: [
                    TotalListTile(total: newBornSum, totalText: 'الأقل من سنة'),
                    TotalListTile(
                      total: childrenUnder5Sum,
                      totalText: 'الأقل من خمسة سنوات',
                    ),
                    TotalListTile(
                      total: childrenOver5Sum,
                      totalText: 'الأكثر من خمسة سنوات',
                    ),

                    TotalListTile(
                      total: totalChildren,
                      totalText: 'الإجمالي الكلي',
                    ),
                    TotalBottleListTile(
                      total: bottlesSum,
                      totalText: 'قارورات',
                    ),
                    TotalBottleListTile(
                      total: totalUsedBottles,
                      totalText: 'مستخدمة',
                    ),
                    TotalBottleListTile(
                      total: totalUnusedBottles,
                      totalText: 'غير مستخدمة',
                    ),
                    TotalBottleListTile(
                      total: totalReturnedBottles,
                      totalText: 'مرجعة',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, index) => TeamsCard(
                    index: index,
                    newBornController:
                        teamsController.newBornControllers[index],
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
                    unusedBottlesControllers:
                        teamsController.unusedBottlesControllers[index],
                  ),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamsCard extends StatelessWidget {
  const TeamsCard({
    super.key,
    required this.index,
    required this.childrenUnder5Controller,
    required this.childrenOver5Controller,
    required this.recievedBottlesController,
    required this.usedBottlesController,
    required this.unusedBottlesControllers,
    required this.returnedBottlesControllers,
    required this.newBornController,
    required TextEditingController unusedBottlesController,
  });

  final int index;
  final TextEditingController newBornController;
  final TextEditingController childrenUnder5Controller;
  final TextEditingController childrenOver5Controller;
  final TextEditingController recievedBottlesController;
  final TextEditingController usedBottlesController;
  final TextEditingController unusedBottlesControllers;
  final TextEditingController returnedBottlesControllers;

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'فريق رقم ${index + 1}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                SizedBox(
                  width: 90,
                  child: TextField(
                    controller: newBornController,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('أطفال <1'),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: TextField(
                    controller: childrenUnder5Controller,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('أطفال <5'),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: TextField(
                    controller: childrenOver5Controller,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('أطفال >5'),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: recievedBottlesController,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('قارورات'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'حالة القارورات',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Divider(),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                SizedBox(
                  width: 110,
                  child: TextField(
                    controller: usedBottlesController,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('مستخدمة'),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: unusedBottlesControllers,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('غير مستخدمة'),
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: TextField(
                    controller: returnedBottlesControllers,
                    keyboardType: TextInputType.number,
                    decoration: inputStyle('مرجعة'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
