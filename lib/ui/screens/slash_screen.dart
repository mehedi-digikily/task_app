import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/ui/screens/main_bottom_nav_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/body_background.dart';
import 'log_in_screen.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  Future<void> goToLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => token == null
                ? const LogInScreen()
                : const MainBottomNavScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         BodyBackground(
           child:  Center(
             child: SvgPicture.asset(
               'assets/images/logo.svg',
               width: double.infinity,
               height: 50,
             ),
           ),
         ),
        ]
      ),
    );
  }
}
