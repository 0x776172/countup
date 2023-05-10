import 'package:countup/screen/history_screen.dart';
import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Streak History',
      onPressed: () {
        // Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HistoryScreen(),
          ),
        );
      },
      icon: const Icon(
        Icons.history,
      ),
    );
  }
}
