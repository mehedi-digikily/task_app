import 'package:flutter/material.dart';
import 'package:new_project/ui/widgets/body_background.dart';

import '../widgets/profile_summary_card.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              const ProfileSummaryCard(),
              Expanded(
                child: BodyBackground(
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 52,
                              ),
                              Text(
                                'Add New Task',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Subject',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                maxLines: 8,
                                decoration: const InputDecoration(
                                  hintText: 'Description',
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.arrow_circle_right_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                        ),
                      ),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
