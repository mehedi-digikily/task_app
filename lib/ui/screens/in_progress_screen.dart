import 'package:flutter/material.dart';

import '../widgets/profile_summary_card.dart';
import '../widgets/task_item_card.dart';

class InProgressScreen extends StatefulWidget {
  const InProgressScreen({super.key});

  @override
  State<InProgressScreen> createState() => _InProgressScreenState();
}

class _InProgressScreenState extends State<InProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => const TaskItemCard(text: 'Progress',),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
