import 'package:flutter/material.dart';

import '../widgets/profile_summary_card.dart';
import '../widgets/task_item_card.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
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
                  itemBuilder: (context, index) => const TaskItemCard(text: 'Completed',),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
