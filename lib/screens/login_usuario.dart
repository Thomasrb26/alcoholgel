import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/providers/login_form_provider.dart';
import 'package:flutter_application_1/screens/usuario/diseno_usuario.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/screens/usuario/usuario.dart';

class LoginUsuario extends StatefulWidget {
  static String id = 'login_usuario';

  const LoginUsuario({Key? key}) : super(key: key);

  //LoginPage({Key? key}) : super(key: key);

  @override
  //_LoginpageState createState() => _LoginpageState();
  _LoginUsuario createState() => _LoginUsuario();
}

class _LoginUsuario extends State<LoginUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DisenologinUsuario(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 500),
            Cardcontainer(
                child: Column(
              children: [
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _Loginform(),
                )
              ],
            )),
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
            Navigator.pushNamed(context, 'vista_alertas');
          });
    });
  }
}

class _Loginform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '2016407026',
                  labelText: ' Ingrese Matricula',
                  prefixIcon: Icons.login_rounded),
              onChanged: (value) => loginForm.matricula = value,
              validator: (value) {
                String pattern = r'([0-9]{10})';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Matricula no valida';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Color.fromARGB(255, 109, 109, 109),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(Duration(seconds: 1));

                        // TODO: validar si el login es correcto
                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(
                            context, 'vista_alertas');
                      })
          ],
        ),
      ),
    );
  }
}
