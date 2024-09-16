import 'package:flutter/material.dart';
import 'package:new_project/ui/screens/slash_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SlashScreen(),
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
         border: OutlineInputBorder(borderSide: BorderSide.none),
         focusedBorder:
         OutlineInputBorder(borderSide: BorderSide.none),
         fillColor: Colors.white,
         filled: true,
       ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        )
      ),
      // primaryColor: Colors.green,
      // primarySwatch: Colors.green,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Colors.green
        ),
      ),
    ),
    );
  }
}
