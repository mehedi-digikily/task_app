import 'package:flutter/material.dart';
import 'package:new_project/data_net_work/network_caller.dart';
import 'package:new_project/data_net_work/urls.dart';
import 'package:new_project/ui/screens/sing_up_screen.dart';
import 'package:new_project/ui/widgets/body_background.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/utility/urls.dart';
import '../../network_caller/network_caller.dart';
import '../widgets/snake_message.dart';
import 'forget_password_screen.dart';
import 'main_bottom_nav_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _impLogin = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Lets Start With',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                        controller: _emailTEC,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (String? value) {
                          if (value
                              ?.trim()
                              .isEmpty ?? true) {
                            return 'enter valued email';
                          } else {
                            return null;
                          }
                        }
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        controller: _passwordTEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'enter valued password';
                          } else {
                            return null;
                          }
                        }
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _singIn,
                        child: Visibility(
                          replacement: const Center(
                            child: CircularProgressIndicator(),),
                          visible: _impLogin == false,
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont Have an Account?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const SingUpScreen(),));
                          },
                          child: const Text(
                            'Sing Up',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _singIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _impLogin = true;
    if (mounted) {
      setState(() {
      });
    }
    NetworkResponse response = await NetworkCaller().postRequest(
        Urls.login, body: {
      "email": _emailTEC.text.trim(),
      "password": _passwordTEC.text.trim()
    });
    _impLogin = false;
    if (mounted) {
      setState(() {

      });
    }
    if (mounted) {
      if (response.isSuccess) {
        SharedPreferences sharedPreference =
            await SharedPreferences.getInstance();
        sharedPreference.setString('token', response.jsonData['token']);
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainBottomNavScreen(),
            ),
          );
        }
        if (mounted) {
          snakeMessage(context, 'Log in Success');
        }
      } else if (response.statusCode == 401) {
        snakeMessage(context, 'Please Check your password/email');
      } else {
        if (mounted) {
          snakeMessage(context, 'some thing is wrong');
        }
      }
    }
  }

    @override
    void dispose() {
      _emailTEC.dispose();
      _passwordTEC.dispose();
      super.dispose();
    }
}

