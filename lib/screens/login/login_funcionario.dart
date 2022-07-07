import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login/diseno_funcionario.dart';
import 'package:flutter_application_1/screens/usuario/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/providers/login_form_provider.dart';
import 'package:flutter_application_1/screens/login/diseno_usuario.dart';
import 'package:flutter_application_1/services/auth_service.dart';

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
            const SizedBox(height: 50),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Cardcontainer(
                  child: Column(
                children: [
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginformFun(),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    ));
  }
}

class _LoginformFun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: '123456789',
                labelText: ' Ingrese Rut sin guión',
                prefixIcon: Icons.login_rounded),
            onChanged: (value) => loginForm.matricula = value,
            validator: (value) {
              String pattern = r'([0-9]{9})';
              RegExp regExp = new RegExp(pattern);
              return regExp.hasMatch(value ?? '') ? null : 'rut no valido';
            },
          ),
          const SizedBox(height: 30),
          TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 16.0),
                // primary: Colors.red[900],
                backgroundColor: Colors.red[900]),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!loginForm.isValidForm()) return;
                    loginForm.isLoading = true;
                    await Future.delayed(const Duration(seconds: 1));
                    loginForm.isLoading = false;
                    await authService.agregarUsuario(loginForm.matricula, 1);
                    authService.idUsuario = loginForm.matricula;
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              const HomeFuncionarioScreen(),
                        ),
                        ModalRoute.withName('/'));
                  },
            child: Text(
              loginForm.isLoading ? 'Espere' : 'Ingresar',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Atrás',
                style: TextStyle(color: Colors.grey[600]),
              ))
        ],
      ),
    );
  }
}
