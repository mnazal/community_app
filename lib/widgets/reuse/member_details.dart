import 'package:community_app/config/colors.dart';
import 'package:community_app/config/members.dart';
import 'package:flutter/material.dart';

class MemberDetails extends StatefulWidget {
  final int idValue;
  const MemberDetails({super.key, required this.idValue});

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  bool followed = false;

  @override
  Widget build(BuildContext context) {
    final member = members[widget.idValue];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 49,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: Image.asset(
                member['image'],
                fit: BoxFit.contain,
              ).image,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  member['name'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  '${member['age']}, ${member['country']}',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            FilledButton(
              onPressed: () {
                setState(() {
                  followed = !followed;
                });
              },
              style: FilledButton.styleFrom(
                backgroundColor: followed ? Colors.grey : secondaryText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(followed ? 'Following' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
