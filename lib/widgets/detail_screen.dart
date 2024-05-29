import 'package:community_app/widgets/button_list.dart';
import 'package:community_app/widgets/part1.dart';
import 'package:community_app/widgets/part2.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
        child: const Column(
          children: [
            SizedBox(height: 8),
            PartScreen(),
            SizedBox(height: 12),
            Part2Screen(),
            SizedBox(height: 8),
            ButtonList(),
          ],
        ),
      ),
    );
  }
}
