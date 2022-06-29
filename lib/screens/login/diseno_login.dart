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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Image(image: AssetImage('images/logoutal.png',), height: 70,),
                Image(image: AssetImage('images/logoingenieria.png'),height: 70,),
              ],
            ),
            const SizedBox(height: 30,),
            const Text('Seleccione su perfil:', style: TextStyle(fontSize: 18  )),
            const SizedBox(height: 20,),
            _botonFuncionario(),
            const SizedBox(height: 20),
            _botonEstudiante()
          ],
        ),
      ),
    );
  }
}

Widget _botonEstudiante() {
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
          Navigator.pushNamed(context, 'loginUsuario');
        });
  });
}

Widget _botonFuncionario() {
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
          // Navigator.pushNamed(context, 'loginFun');
          Navigator.pushNamed(context, 'home_funcionario');
        });
  });
}
