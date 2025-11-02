import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polio_vaccination_tracker/registrar/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(MainController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                buttonColor: Colors.blue[900],
                onConfirm: () {
                  controller.clearAllFields();
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
              Get.defaultDialog(
                buttonColor: Colors.blue[900],
                onConfirm: () {
                  Get.back();
                },
                textConfirm: 'تم',
                titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                title: 'المجموع',
                content: Column(
                  children: [
                    TotalListTile(
                      total: controller.getNewbornTotal,
                      totalText: 'الأقل من سنة',
                    ),
                    TotalListTile(
                      total: controller.getYoungTotal,
                      totalText: 'الأقل من خمسة سنوات',
                    ),
                    TotalListTile(
                      total: controller.getOldTotal,
                      totalText: 'الأكثر من خمسة سنوات',
                    ),
                    TotalListTile(
                      total: controller.getTotal,
                      totalText: 'الكلي',
                    ),
                    TotalBottleListTile(
                      total: controller.getBottlesDifference(),
                      totalText: 'عدد القارورات الغير مستخدمة',
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.check, color: Colors.white, size: 32),
          ),
        ],
        title: const Text(
          'كاتب التطعيم',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[900]!,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: GetBuilder<MainController>(
            init: MainController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomListTileNewBorn(
                      count: controller.getNewbornBoy,
                      emoji: '👼🏻',
                      childGender: 'الذكور الأقل',
                      backColor: Colors.grey,
                      countColor: Colors.blue[400]!,
                      increament: () {
                        controller.incrementNewbornBoy();
                      },
                      decrement: () {
                        controller.decrementNewbornBoy();
                      },
                    ),
                    CustomListTileNewBorn(
                      count: controller.getNewbornGirl,
                      emoji: '👼🏻',
                      childGender: 'الإناث الأقل',
                      backColor: Colors.blue[900]!,
                      countColor: Colors.grey[400]!,
                      increament: () {
                        controller.incrementNewbornGirl();
                      },
                      decrement: () {
                        controller.decrementNewbornGirl();
                      },
                    ),
                    CustomListTile(
                      count: controller.getYoungBoy,
                      emoji: '👶🏻',
                      childGender: 'الذكور الأقل',
                      backColor: Colors.grey,
                      countColor: Colors.blue[400]!,
                      increament: () {
                        controller.youngBoyIncrement();
                      },
                      decrement: () {
                        controller.youngBoyDecrement();
                      },
                    ),
                    CustomListTile(
                      count: controller.getYoungGirl,
                      emoji: '👶🏻',
                      childGender: 'الإناث الأقل',
                      backColor: Colors.blue[900]!,
                      countColor: Colors.grey[400]!,
                      increament: () {
                        controller.youngGirlIncrement();
                      },
                      decrement: () {
                        controller.youngGirlDecrement();
                      },
                    ),
                    CustomListTile(
                      count: controller.getOldBoy,
                      emoji: '👦🏻',
                      childGender: 'الذكور الأكثر',
                      backColor: Colors.grey,
                      countColor: Colors.blue[400]!,
                      increament: () {
                        controller.oldBoyIncrement();
                      },
                      decrement: () {
                        controller.oldBoyDecrement();
                      },
                    ),
                    CustomListTile(
                      count: controller.getOldGirl,
                      emoji: '👧🏻',
                      childGender: 'الإناث الأكثر',
                      backColor: Colors.blue[900]!,
                      countColor: Colors.grey[400]!,
                      increament: () {
                        controller.oldGirlIncrement();
                      },
                      decrement: () {
                        controller.oldGirlDecrement();
                      },
                    ),
                    CustomBottleListTile(
                      increment: controller.incrementBottles,
                      decrement: controller.decrementBottles,
                      str: 'المستلمة',
                      count: controller.getBottles,
                      clr2: Colors.blue[400]!,
                      emoji: '',
                    ),
                    CustomBottleListTile(
                      increment: controller.incrementUsedBottles,
                      decrement: controller.decrementUsedBottles,
                      str: 'المستخدمة',
                      count: controller.getUsedBottles,
                      clr2: Colors.grey[400]!,
                      clr: Colors.blue[900]!,
                      emoji: '',
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomBottleListTile extends StatelessWidget {
  const CustomBottleListTile({
    super.key,
    required this.increment,
    required this.decrement,
    required this.str,
    required this.count,
    this.clr = Colors.grey,
    required this.clr2,
    required this.emoji,
  });
  final Function() increment;
  final Function() decrement;
  final String str;
  final int count;
  final Color clr;
  final Color clr2;
  final String emoji;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        tileColor: clr,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 24)),
                Text(
                  'عدد القارورات $str',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 48),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  color: clr2,
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red[700],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: increment,
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red[100],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: decrement,
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
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

class TotalListTile extends StatelessWidget {
  const TotalListTile({
    super.key,
    required this.total,
    required this.totalText,
  });

  final int total;
  final String totalText;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        tileColor: Colors.blue[900],
        trailing: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[400],
          child: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Text(
              total.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          'مجموع الأطفال $totalText',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TotalBottleListTile extends StatelessWidget {
  const TotalBottleListTile({
    super.key,
    required this.total,
    required this.totalText,
  });

  final int total;
  final String totalText;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        tileColor: Colors.blue[900],
        trailing: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[400],
          child: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Text(
              total.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          totalText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.count,
    required this.emoji,
    required this.childGender,
    required this.countColor,
    required this.backColor,
    required this.increament,
    required this.decrement,
  });
  final int count;
  final String emoji;
  final String childGender;
  final Color countColor;
  final Color backColor;
  final void Function() increament;
  final void Function() decrement;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        tileColor: backColor,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 24)),
                Text(
                  'عدد الأطفال $childGender من خمسة سنوات',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  color: countColor,
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red[700],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: increament,
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red[100],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: decrement,
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
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

class CustomListTileNewBorn extends StatelessWidget {
  const CustomListTileNewBorn({
    super.key,
    required this.count,
    required this.emoji,
    required this.childGender,
    required this.countColor,
    required this.backColor,
    required this.increament,
    required this.decrement,
  });
  final int count;
  final String emoji;
  final String childGender;
  final Color countColor;
  final Color backColor;
  final void Function() increament;
  final void Function() decrement;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        tileColor: backColor,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 24)),
                Text(
                  'عدد الأطفال $childGender من سنة',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  color: countColor,
                  child: Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red[700],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: increament,
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red[100],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: decrement,
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
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
