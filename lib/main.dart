import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/usuario/usuario.dart';
import 'package:flutter_application_1/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        // 'home':(context) => const MisAlertasScreen(),
        'home':(context) => const AlertaInfoScreen(),
        'alertaInfo':(context) => const AlertaInfoScreen()
      },
    );
  }
}
