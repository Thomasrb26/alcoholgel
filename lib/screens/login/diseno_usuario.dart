import 'package:flutter/material.dart';

class DisenologinUsuario extends StatelessWidget {
  final Widget child;

  const DisenologinUsuario({Key? key, required this.child}) : super(key: key);

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
              children: [
                Image(image: AssetImage('images/logoutal.png',), height: 70),
                Image(image: AssetImage('images/logoingenieria.png'), height: 70,),
              ],
            ),
                child
          ],
        ),
      ),
    );
  }
}
// Widget solicitarRut() {
//   return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: TextField(
//         keyboardType: TextInputType.url,
//         decoration: const InputDecoration(
//             icon: Icon(Icons.login),
//             hintText: '2016407026',
//             labelText: ('Ingrese su matricula')),
//         onChanged: (value) {},
//       ),
//     );
//   });
// }
