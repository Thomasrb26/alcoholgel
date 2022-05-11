import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/usuario/HomeAlertasScreen.dart';
import 'package:flutter_application_1/screens/usuario/MisAlertasScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MisAlertasScreen.id,
      routes: {
        MisAlertasScreen.id: (context) => MisAlertasScreen(),
      },
    );
  }
}
