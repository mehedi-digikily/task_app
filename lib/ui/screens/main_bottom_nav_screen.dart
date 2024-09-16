import 'package:flutter/material.dart';
import 'canceled_screen.dart';
import 'complated_screen.dart';
import 'in_progress_screen.dart';
import 'new_task_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

   int _selectedIndex = 0;
   final List<Widget> _screens = [
    const NewTaskScreen(),
    const InProgressScreen(),
     const CompletedScreen(),
     const CanceledScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.change_circle),label: 'In-Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel),label: 'Cancelled'),
        ],
      ),
    );
  }
}
