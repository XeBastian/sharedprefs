import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/views/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void _register() async {
    // save to sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isRegistered', true);
    Get.offAll(() => const MyHomePage());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Click below to uuhm register',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _register,
        tooltip: 'Register',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
