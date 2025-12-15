import 'package:flutter/material.dart';
import 'package:polio_vaccination_tracker/registrar/views/widgets/counter_tile.dart';

class AgeGroupTiles extends StatelessWidget {
  final int boyCount;
  final int girlCount;

  final VoidCallback boyIncrement;
  final VoidCallback boyDecrement;
  final VoidCallback girlIncrement;
  final VoidCallback girlDecrement;

  final String boyLabel;
  final String girlLabel;
  final String emojiBoy;
  final String emojiGirl;

  const AgeGroupTiles({
    super.key,
    required this.boyCount,
    required this.girlCount,
    required this.boyIncrement,
    required this.boyDecrement,
    required this.girlIncrement,
    required this.girlDecrement,
    required this.boyLabel,
    required this.girlLabel,
    required this.emojiBoy,
    required this.emojiGirl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CounterTile(
          count: boyCount,
          emoji: emojiBoy,
          label: boyLabel,
          countColor: Colors.deepPurple[200]!,
          backColor: Colors.deepPurple[700]!,
          increment: boyIncrement,
          decrement: boyDecrement,
        ),
        CounterTile(
          count: girlCount,
          emoji: emojiGirl,
          label: girlLabel,
          countColor: Colors.purple[200]!,
          backColor: Colors.deepPurple[800]!,
          increment: girlIncrement,
          decrement: girlDecrement,
        ),
      ],
    );
  }
}
