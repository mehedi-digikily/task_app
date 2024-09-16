import 'package:flutter/material.dart';

import '../widgets/profile_summary_card.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_item_card.dart';
import 'add_new_task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryCard(count: '09', tittle: 'New'),
                    SummaryCard(count: '10', tittle: 'In Progress'),
                    SummaryCard(count: '11', tittle: 'Complete'),
                    SummaryCard(count: '12', tittle: 'Cancel'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => const TaskItemCard(text: 'New',),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTask(),),);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

