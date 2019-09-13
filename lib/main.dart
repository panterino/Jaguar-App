import 'package:flutter/material.dart';
import 'package:jaguar/src/bloc/provider.dart';
import 'package:jaguar/src/pages/home_page.dart';
import 'package:jaguar/src/pages/login_page.dart';
import 'package:jaguar/src/pages/register_page.dart';
import 'package:jaguar/src/user_preferences/user_preferences.dart';

void main() async {
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jaguar',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'home': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ));
  }
}
