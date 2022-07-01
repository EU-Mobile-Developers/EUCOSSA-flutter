import 'package:eu_mobile/utils/theme.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash_screen.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('EUCOSSA'),
          const FlutterLogo(
            size: 200,
            textColor:AppTheme.gradientColor,
          ),
          TextButton(
            onPressed: () {
              //todo: open registration page
            },
            child: const Text(
              'GET STARTED',
              style: TextStyle(
                color:AppTheme.gradientColor,
              ),
            ),
          ),
          const Text('By Pressing \'Get started\' you agree to our'),
          const Text(
            'privacy polcy & terms of service',
            style: TextStyle(
              color:AppTheme.gradientColor,
            ),
          )
        ],
      ),
    );
  }
}
