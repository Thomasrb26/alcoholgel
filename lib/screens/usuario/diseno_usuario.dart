import 'package:flutter/material.dart';

class DisenologinUsuario extends StatelessWidget {
  final Widget child;

  const DisenologinUsuario({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 238, 238, 240),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
              child: Image(
                image: AssetImage('images/logoutal.png'),
                height: 200,
              ),
              top: 120,
              left: 100),
          Positioned(
              child: Image(
                image: AssetImage('images/logoingenieria.png'),
                height: 100,
              ),
              top: 350,
              left: 50),
          //_inglogo(),
          //Positioned(child: _botonlogin(), top: 620, left: 124),
          //Positioned(child: solicitarRut(), top: 520),

          //Positioned(child: _botonlogin2(), top: 570, left: 114),
          //_HeaderIcon(),
          this.child,
        ],
      ),
    );
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
          Navigator.pushNamed(context, 'vista_alertas');
        });
  });
}

Widget solicitarRut() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        keyboardType: TextInputType.url,
        decoration: const InputDecoration(
            icon: Icon(Icons.login),
            hintText: '2016407026',
            labelText: ('Ingrese su matricula')),
        onChanged: (value) {},
      ),
    );
  });
}
