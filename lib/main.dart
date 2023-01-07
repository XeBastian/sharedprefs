import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/views/homepage.dart';
import 'package:shared/views/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isRegistered = prefs.getBool('isRegistered') ?? false;

  runApp(MyApp(isRegistered: isRegistered));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isRegistered});
  final bool isRegistered;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shared Prefs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isRegistered ? const MyHomePage() : const Register(),
    );
  }
}
