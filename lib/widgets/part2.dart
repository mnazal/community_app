import 'package:flutter/material.dart';

class Part2Screen extends StatelessWidget {
  const Part2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Media, docs and links',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              IconButton(
                  iconSize: 18,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios))
            ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/bg.png',
                      fit: BoxFit.cover,
                      width: 97,
                      height: 97,
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
