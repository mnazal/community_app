import 'package:community_app/config/colors.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final String iconName;
  final IconData iconFile;
  final int colorValue;
  const ButtonIcon({
    super.key,
    required this.iconName,
    required this.iconFile,
    required this.colorValue,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = colorValue == 1 ? primaryColor : Colors.black;
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Icon(
          iconFile,
          size: 30,
          color: buttonColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          iconName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: buttonColor,
          ),
        ),
      ]),
    );
  }
}
