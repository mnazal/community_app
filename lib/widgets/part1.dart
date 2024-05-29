import 'package:flutter/material.dart';

import '../config/colors.dart';

class PartScreen extends StatelessWidget {
  const PartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper ame...',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: secondaryText),
                    borderRadius: BorderRadius.circular(14)),
                child: Text(
                  i == 4 ? '+1' : 'Outdoor',
                  style: const TextStyle(color: secondaryText, fontSize: 12),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
