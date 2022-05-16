import 'package:flutter/material.dart';

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
    return DropdownButton(
      value: dropdownvalue,
      items: tipoAlerta.map((String e) {
        return DropdownMenuItem(value: e,child: Text(e),);
      }).toList() , 
      onChanged: (String? newValue) { 
        setState(() {
          dropdownvalue = newValue!;
        });
      }
    );
  }
}