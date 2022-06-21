import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alerta.dart';

class AlertaFormProvider extends ChangeNotifier {

  // Mantener referencia del formulario de alertas
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Instanciar una alerta
  Alertas alerta;

  // Inicializar la instancia de alerta mediante el constructor
  AlertaFormProvider(this.alerta);

  bool isvalidForm() {
    // print(alerta.edificio);
    // print(alerta.sala);
    // print(alerta.fechaCreacion);
    // print(alerta.tipoAlerta);
    // print(alerta.comentario);
    // print(alerta.estado);
    return formKey.currentState?.validate() ?? false;
  }

}