import 'package:community_app/widgets/reuse/button_class.dart';
import 'package:flutter/material.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mute notification',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Switch.adaptive(
                value: false,
                onChanged: (_) {},
                applyCupertinoTheme: true,
                inactiveTrackColor: Colors.white,
              )
            ]),
        const SizedBox(height: 6),
        const ButtonIcon(
          iconFile: Icons.delete_outlined,
          iconName: 'Clear chat',
          colorValue: 0,
        ),
        const ButtonIcon(
          iconFile: Icons.lock_outline,
          iconName: 'Encryption',
          colorValue: 0,
        ),
        const ButtonIcon(
          iconFile: Icons.logout,
          iconName: 'Exit community',
          colorValue: 1,
        ),
        const ButtonIcon(
          iconFile: Icons.thumb_down_alt_outlined,
          iconName: 'Report',
          colorValue: 1,
        ),
      ],
    );
  }
}
