import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/usuario/HomeAlertasScreen.dart';
import 'package:flutter_application_1/screens/usuario/MisAlertasScreen.dart';

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
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'images/logoingenieria.png',
                height: 100,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            solicitarRut(),
            const Spacer(),
            _botonlogin(),
          ],
        ),
      )),
    );
  }

  Widget solicitarRut() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.url,
          decoration: const InputDecoration(
              icon: Icon(Icons.login),
              hintText: '12345678-9',
              labelText: ('Ingrese su rut')),
          onChanged: (value) {},
        ),
      );
    });
  }
}

Widget _botonlogin() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
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
          Navigator.pushNamed(context, 'home');
        });
  });
}
