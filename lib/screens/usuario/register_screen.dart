import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/usuario/diseno_funcionario.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/login_form_provider.dart';
import 'package:flutter_application_1/screens/usuario/input_decorations.dart';
//import 'package:productos_app/widgets/widgets.dart';
import 'package:flutter_application_1/screens/usuario/card_login.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  //LoginPage({Key? key}) : super(key: key);
  @override
  //_LoginpageState createState() => _LoginpageState();
  _RegisterUser createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DisenologinFuncionario(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 500),
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
                  hintText: '12345678-9',
                  labelText: ' Ingrese Su Rut',
                  prefixIcon: Icons.login_rounded),
              onChanged: (value) => loginForm.matricula = value,
              validator: (value) {
                String pattern = r'([0-9]{10})';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'Rut no valido';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromARGB(255, 109, 109, 109),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: const TextStyle(color: Colors.white),
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(const Duration(seconds: 1));

                        // TODO: validar si el login es correcto
                        loginForm.isLoading = false;

                        Navigator.pushReplacementNamed(context, '');
                      })
          ],
        ),
      ),
    );
  }
}
