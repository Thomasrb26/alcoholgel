import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/services/auth_service.dart';


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
        ChangeNotifierProvider(create: (_) => AlertaService()),
        ChangeNotifierProvider(create: (_) => AuthService())
        ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Quitar banner de modo debug en previsualizacion de android.
      debugShowCheckedModeBanner: false,

      // Definir el tema global de la aplicacion
      theme: AppTheme.lightTheme,

      // Definir la ruta inicial por defecto
      initialRoute: 'check_auth',

      // Definir las demas rutas con sus respectivos componentes
      routes: {
        'login': (context) => const LoginPage(),
        'home_usuario': (context) => const MisAlertasScreen(),
        'alertaInfo': (context) => const AlertaInfoScreen(),
        'loginUsuario': ((context) => const LoginUsuario()),
        'loginFun': ((context) => const LoginFuncionario()),
        'alertaExistente':(context) => const AlertaInfoExistenteScreen(),
        'home_funcionario':(context) => const HomeFuncionarioScreen(),
        'check_auth':(context) => const CheckAuthScreen(),
      },
      
      );
  }
}
