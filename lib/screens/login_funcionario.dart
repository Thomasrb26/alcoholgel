import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/usuario/diseno_funcionario.dart';

import 'package:flutter_application_1/screens/usuario/usuario.dart';

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
            SizedBox(height: 200),
            Cardcontainer(child: Column()),
          ],
        ),
      ),
    ));
  }

  Widget _botonlogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: const Text('Entrar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 20,
          onPressed: () {
            // final route = MaterialPageRoute(
            //     builder: (context) => const MisAlertasScreen());
            // Navigator.push(context, route);
            Navigator.pushNamed(context, '');
          });
    });
  }
}
