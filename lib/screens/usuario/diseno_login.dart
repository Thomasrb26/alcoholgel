import 'package:flutter/material.dart';

class Disenologin extends StatelessWidget {
  final Widget child;

  const Disenologin({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 238, 238, 240),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const Positioned(
              child: Image(
                image: AssetImage('images/logoutal.png'),
                height: 200,
              ),
              top: 120,
              left: 100),
          const Positioned(
              child: Image(
                image: AssetImage('images/logoingenieria.png'),
                height: 100,
              ),
              top: 350,
              left: 50),
          //_inglogo(),
          Positioned(child: _botonlogin(), top: 480, left: 110),
          Positioned(child: _botonlogin2(), top: 570, left: 114),
          //_HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

Widget _botonlogin2() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: const Text('Estudiante',
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
          Navigator.pushNamed(context, 'loginUsuario');
        });
  });
}

Widget _botonlogin() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: const Text('Funcionario',
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
          Navigator.pushNamed(context, 'loginFun');
        });
  });
}
