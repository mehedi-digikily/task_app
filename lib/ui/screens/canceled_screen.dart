import 'package:flutter/material.dart';

import '../widgets/profile_summary_card.dart';
import '../widgets/task_item_card.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
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
                  itemBuilder: (context, index) => const TaskItemCard(text: 'Cancel',),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
