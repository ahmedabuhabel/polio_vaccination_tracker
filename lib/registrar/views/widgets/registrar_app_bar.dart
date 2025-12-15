import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polio_vaccination_tracker/registrar/controller/controller.dart';

import 'total_bottle_list_tile.dart';
import 'total_list_tile.dart';

class RegistrarAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RegistrarAppbar({super.key, required this.controller});

  final RegistrarController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple[700],
      elevation: 6,
      shadowColor: Colors.black45,
      title: const Text(
        'كاتب التطعيم',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white),
          tooltip: 'تصفير المحتوى',
          onPressed: () {
            Get.defaultDialog(
              title: 'تصفير المحتوى',
              titleStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              middleText: 'هل أنت متأكد أنك تريد حذف جميع الإحصائيات؟',
              textConfirm: 'نعم',
              textCancel: 'إلغاء',
              confirmTextColor: Colors.white,
              buttonColor: Colors.red[700],
              onConfirm: () {
                controller.clearAllFields();
                Get.back();
              },
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.summarize, color: Colors.white),
          tooltip: 'عرض المجموع',
          onPressed: () {
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
                  TotalListTile(
                    total: controller.newbornTotal,
                    totalText: 'الأقل من سنة',
                  ),
                  TotalListTile(
                    total: controller.youngTotal,
                    totalText: 'الأقل من خمسة سنوات',
                  ),
                  TotalListTile(
                    total: controller.oldTotal,
                    totalText: 'الأكثر من خمسة سنوات',
                  ),

                  TotalListTile(
                    total: controller.total,
                    totalText: 'الإجمالي الكلي',
                  ),
                  TotalBottleListTile(
                    total: controller.bottlesDifference,
                    totalText: 'القارورات الغير مستخدمة',
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
