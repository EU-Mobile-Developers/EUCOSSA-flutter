import 'package:eu_mobile/screens/communities.dart';
import 'package:eu_mobile/screens/dashboard.dart';
import 'package:eu_mobile/screens/login.dart';
import 'package:eu_mobile/screens/messages.dart';
import 'package:eu_mobile/screens/register.dart';
import 'package:eu_mobile/screens/splash.dart';
import 'package:eu_mobile/screens/welcome.dart';
import 'package:flutter/material.dart';

import 'screens/blogs.dart';

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
        '/registration': (context) => const Register(),
        '/welcome': (context) => const Welcome(),
        '/dashboard': (context) => const Dashboard(),
        '/communities': (context) => const Communities(),
        '/messages': (context) => const Messages(),
        '/blogs': (context) => const Blogs(),
        '/login': (context) => const Login()
      },
    );
  }
}
