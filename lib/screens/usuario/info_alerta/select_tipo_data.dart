import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/alerta_form_provider.dart';

class SelectTipoAlerta extends StatefulWidget {
  const SelectTipoAlerta({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectTipoAlerta> createState() => _SelectTipoAlertaState();
}

class _SelectTipoAlertaState extends State<SelectTipoAlerta> {

  final tipoAlerta = ['Falta Alcohol', 'Error en Dispensador', 'Otro (Especificar)'];
  String dropdownvalue = 'Falta Alcohol';
  
  @override
  Widget build(BuildContext context) {

    final alertaForm = Provider.of<AlertaFormProvider>(context);
    final alerta = alertaForm.alerta;

    return DropdownButton<String>(
      // value: dropdownvalue,
      value: alerta.tipoAlerta,
      items: tipoAlerta.map((String e) {
        return DropdownMenuItem(value: e,child: Text(e),);
      }).toList() , 
      onChanged: ( String? newValue) { 
        alerta.tipoAlerta = newValue!;
        setState(() {
          dropdownvalue = newValue;
        });
      }
    );
  }
}