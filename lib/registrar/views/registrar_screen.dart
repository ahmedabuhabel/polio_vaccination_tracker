import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polio_vaccination_tracker/registrar/controller/controller.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/age_group_tile.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/custom_bottle_list_tile.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/registrar_app_bar.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/section_header.dart';

class RegistrarScreen extends StatelessWidget {
  RegistrarScreen({super.key});
  final controller = Get.put(RegistrarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: RegistrarAppbar(controller: controller),
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SectionHeader(title: '👼🏻 أقل من سنة'),
              AgeGroupTiles(
                boyCount: controller.newbornBoy.value,
                girlCount: controller.newbornGirl.value,
                boyIncrement: controller.incrementNewbornBoy,
                boyDecrement: controller.decrementNewbornBoy,
                girlIncrement: controller.incrementNewbornGirl,
                girlDecrement: controller.decrementNewbornGirl,
                boyLabel: 'ذكور أقل من سنة',
                girlLabel: 'إناث أقل من سنة',
                emojiBoy: '👶🏻',
                emojiGirl: '👶🏻',
              ),

              SectionHeader(title: '👶🏻 أقل من 5 سنوات'),
              AgeGroupTiles(
                boyCount: controller.youngBoy.value,
                girlCount: controller.youngGirl.value,
                boyIncrement: controller.youngBoyIncrement,
                boyDecrement: controller.youngBoyDecrement,
                girlIncrement: controller.youngGirlIncrement,
                girlDecrement: controller.youngGirlDecrement,
                boyLabel: 'ذكور أقل من 5 سنوات',
                girlLabel: 'إناث أقل من 5 سنوات',
                emojiBoy: '🧒🏻',
                emojiGirl: '🧒🏻',
              ),

              SectionHeader(title: '👦🏻 أكثر من 5 سنوات'),
              AgeGroupTiles(
                boyCount: controller.oldBoy.value,
                girlCount: controller.oldGirl.value,
                boyIncrement: controller.oldBoyIncrement,
                boyDecrement: controller.oldBoyDecrement,
                girlIncrement: controller.oldGirlIncrement,
                girlDecrement: controller.oldGirlDecrement,
                boyLabel: 'ذكور أكثر من 5 سنوات',
                girlLabel: 'إناث أكثر من 5 سنوات',
                emojiBoy: '👦🏻',
                emojiGirl: '👧🏻',
              ),

              SectionHeader(title: '💉 القارورات'),
              CustomBottleListTile(
                increment: controller.incrementBottles,
                decrement: controller.decrementBottles,
                str: 'المستلمة',
                count: controller.bottles.value,
                clr2: Colors.deepPurple[400]!,
                emoji: '📦',
              ),
              CustomBottleListTile(
                increment: controller.incrementUsedBottles,
                decrement: controller.decrementUsedBottles,
                str: 'المستخدمة',
                count: controller.usedBottles.value,
                clr2: Colors.grey[400]!,
                emoji: '🧴',
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      }),
    );
  }
}
