import 'package:flutter/material.dart';
import 'package:new_project/ui/widgets/body_background.dart';
import 'package:new_project/ui/widgets/snake_message.dart';
import '../../data/utility/urls.dart';
import '../../network_caller/network_caller.dart';
import 'log_in_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _singUpInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: validateEmail,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _firstName,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: validateRequiredField,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _lastName,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: validateRequiredField,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _phoneNumber,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                      ),
                      validator: validatePhoneNumber,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _password,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: singUp,
                        child: Visibility(
                          visible: _singUpInProgress == false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have Account?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInScreen(),
                                ),);
                          },
                          child: const Text(
                            'Sing In',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
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
  Future <void> singUp() async {
    if (_globalKey.currentState!.validate()) {
      if(mounted){
        setState(() {
          _singUpInProgress = true;
        });
      }
      final NetworkResponse response =
      await NetworkCaller()
          .postRequest(Urls.registration, body: {
        "email": _email.text.trim(),
        "firstName": _firstName.text.trim(),
        "lastName": _lastName.text.trim(),
        "mobile": _phoneNumber.text.trim(),
        "password": _password.text.trim(),
        "photo": ""
      });
      if(mounted){
        setState(() {
          _singUpInProgress = false;
        });
      }
      if (response.isSuccess) {
        _clearTextFild();
        if (mounted) {
          snakeMessage(context,
              'Account has been created! Please login');
        }
      } else {
        if (mounted) {
          snakeMessage(context,
              'Account creation failed! please try again');
        }
      }

    }
  }

  void _clearTextFild(){
    _email.clear();
    _firstName.clear();
    _lastName.clear();
    _phoneNumber.clear();
    _password.clear();
  }

  @override
  void dispose() {
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final phoneRegExp = RegExp(r'^\d{11}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }
}
