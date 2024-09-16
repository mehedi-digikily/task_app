import 'package:flutter/material.dart';

import '../screens/edit_profile_screen.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        }
      },
      tileColor: Colors.green,
      leading: const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.person),
      ),
      title: const Text(
        'Mehedi Hasan',
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
      ),
      subtitle: const Text(
        'info.itsmehedi@gmail.com',
        style: TextStyle(color: Colors.white),
      ),
      trailing: enableOnTap ? const Icon(Icons.arrow_forward) : null,
    );
  }
}
