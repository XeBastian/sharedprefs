import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/views/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  void initState() {
    getCount();
    super.initState();
  }

  void getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('count') ?? 0;
    });
  }

  void _incrementCounter() async {
    // save to sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('count', _counter);
    });
  }

  void _decrementCounter() async {
    // save to sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter--;
      prefs.setInt('count', _counter);
    });
  }

  void _logout() async {
    //  logout at sharedprefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isRegistered', false);
    Get.offAll(() => const Register());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Operations'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 3),
            FloatingActionButton(
              heroTag: '2',
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(height: 3),
            FloatingActionButton(
              heroTag: '3',
              onPressed: _logout,
              tooltip: 'Logout',
              child: const Icon(Icons.exit_to_app),
            ),
          ],
        ));
  }
}
