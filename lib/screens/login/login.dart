import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/usuario/usuario.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  const LoginPage({Key? key}) : super(key: key);

  //LoginPage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Disenologin(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
