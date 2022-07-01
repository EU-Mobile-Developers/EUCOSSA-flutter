import 'package:eu_mobile/screens/communities.dart';
import 'package:eu_mobile/screens/dashboard.dart';
import 'package:eu_mobile/screens/messages.dart';
import 'package:eu_mobile/screens/register.dart';
import 'package:eu_mobile/screens/splash.dart';
import 'package:eu_mobile/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/registration':(context)=>Register() ,
        '/welcome':(context) => Welcome(),
        '/dashboard':(context) => Dashboard(),
        '/communities':(context) => Communities(),
        '/messages':(context) => Messages(),
        '/blogs':(context) => Blogs(),
      },
    );
  }
}
