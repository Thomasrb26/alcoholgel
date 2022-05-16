import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/usuario/usuario.dart';
import 'package:flutter_application_1/services/services.dart';
import 'package:flutter_application_1/themes/app_theme.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const AppState());
}

// Proveer un estado global a la App, permite acceder a cualquier a los providers en cualquier lado.
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlertaService())
      ],
      child: const MyApp() ,
    );
  }
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
        'home':(context) => const MisAlertasScreen(),
        // 'home':(context) => const AlertaInfoScreen(),
        'alertaInfo':(context) => const AlertaInfoScreen()
      },
    );
  }
}
