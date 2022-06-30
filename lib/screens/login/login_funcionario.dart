import 'package:flutter/material.dart';
import 'package:alcoholgelutal/screens/login/diseno_funcionario.dart';

import 'package:alcoholgelutal/screens/usuario/usuario.dart';

class LoginFuncionario extends StatefulWidget {
  static String id = 'login_funcionario';

  const LoginFuncionario({Key? key}) : super(key: key);

  //LoginPage({Key? key}) : super(key: key);

  @override
  //_LoginpageState createState() => _LoginpageState();
  _LoginFuncionario createState() => _LoginFuncionario();
}

class _LoginFuncionario extends State<LoginFuncionario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DisenologinFuncionario(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Cardcontainer(child: Column()),
          ],
        ),
      ),
    ));
  }

}
