import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key, required this.count, required this.tittle,
  });
  final String count, tittle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
        child: Column(
          children: [
            Text(count,style: Theme.of(context).textTheme.titleLarge,),
             Text(tittle),
          ],
        ),
      ),
    );
  }
}
