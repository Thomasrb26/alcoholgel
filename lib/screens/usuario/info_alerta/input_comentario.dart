import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/alerta_form_provider.dart';

class InputComentario extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String formProperty;
  //final Map<String, String> formValues;

  const InputComentario({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.isPassword = false,
    required this.formProperty,
    // required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alertaForm = Provider.of<AlertaFormProvider>(context);
    final alerta = alertaForm.alerta;

    return TextFormField(
      minLines: 5,
      maxLines: 5,
      autofocus: false,
      initialValue: alerta.comentario,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: isPassword,
      onChanged: (value) {
        alerta.comentario = value;
        // formValues[formProperty] = value;
        // print(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        // prefixIcon: Icon(Icons.verified_user_rounded),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
