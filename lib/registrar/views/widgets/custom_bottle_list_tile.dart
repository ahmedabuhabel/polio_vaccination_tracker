import 'package:flutter/material.dart';

class CustomBottleListTile extends StatelessWidget {
  const CustomBottleListTile({
    super.key,
    required this.increment,
    required this.decrement,
    required this.str,
    required this.count,
    required this.clr2,
    required this.emoji,
    this.clr = Colors.deepPurple,
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        tileColor: clr,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        title: Column(
          children: [
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'عدد القارورات $str',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: clr2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: increment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(48, 48),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(48, 48),
                  ),
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
