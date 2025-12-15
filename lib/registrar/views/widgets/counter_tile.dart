import 'package:flutter/material.dart';

class CounterTile extends StatelessWidget {
  final int count;
  final String emoji;
  final String label;
  final Color countColor;
  final Color backColor;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CounterTile({
    super.key,
    required this.count,
    required this.emoji,
    required this.label,
    required this.countColor,
    required this.backColor,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        tileColor: backColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        title: Column(
          children: [
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: countColor,
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
