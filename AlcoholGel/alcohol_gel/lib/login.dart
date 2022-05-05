import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [Image.asset('images/LogoIngenieriaFINAL.png')],
        ),
      )),
    );
  }
}
