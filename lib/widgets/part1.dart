import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';

class PartScreen extends StatelessWidget {
  const PartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReadMoreText(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper amet.',
            maxLength: 60,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: 'ProximaNova'),
          ),
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

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
  final TextStyle style;

  ReadMoreText(
      {required this.text, required this.maxLength, required this.style});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayText = isExpanded
        ? widget.text
        : widget.text.substring(0, widget.maxLength) + '...';

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: displayText,
            style: widget.style,
          ),
          if (!isExpanded)
            TextSpan(
              text: displayText,
              style: widget.style,
            ),
          TextSpan(
            text: isExpanded ? 'Read less' : 'Read more',
            style: TextStyle(
                color: secondaryText, fontSize: widget.style.fontSize),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
          ),
        ],
      ),
    );
  }
}
