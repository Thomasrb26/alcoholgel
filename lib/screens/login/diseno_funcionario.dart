import 'package:flutter/material.dart';

class DisenologinFuncionario extends StatelessWidget {
  final Widget child;

  const DisenologinFuncionario({Key? key, required this.child})
      : super(key: key);

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
          child,
        ],
      ),
    );
  }
}

Widget solicitarRut() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
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
