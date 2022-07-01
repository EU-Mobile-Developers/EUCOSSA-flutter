import 'package:eu_mobile/screens/register.dart';
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
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(Colors.grey.shade700, BlendMode.darken),
              image: const AssetImage('assets/splash_screen.png'),
              opacity: 0.3,
              fit: BoxFit.fitHeight),
        ),
        child: Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: const [
                    Text(
                      'EUCOSSA',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFFFF9800),
                      ),
                    ),
                    FlutterLogo(
                      size: 350,
                      textColor: AppTheme.gradientColor,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange.shade700),
                      ),
                      onPressed: () {
                        //todo: open registration page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'By Pressing \'Get started\' you agree to our',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const Text(
                      'privacy policy & terms of service',
                      style: TextStyle(
                          color: AppTheme.gradientColor, fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
