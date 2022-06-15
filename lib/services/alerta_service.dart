import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:http/http.dart' as http;

class AlertaService extends ChangeNotifier {

  final String _baseUrl = 'alcoholgel-app-utal-default-rtdb.firebaseio.com';
  final List<Alertas> alertas = [];

  bool isLoading = true;
  bool isSaving = false;
  AlertaService(){
    cargarAlertas();
  }

  Future cargarAlertas() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'alertas.json');
    final resp = await http.get(url);

    final Map<String,dynamic> alertasMap = json.decode(resp.body);
    // return alertasMap;

    alertasMap.forEach((key, value) {
      final tempAlerta = Alertas.fromJson(value);
      tempAlerta.id = key;
      alertas.add(tempAlerta);
    });
    isLoading = false;
    notifyListeners();

    // print(alertas[0].id);
  }
  Future saveOrCreateAlerta(Alertas alerta) async {

    // Avisar a cualquier componente que este utilizando isSaving que esta en true
    isSaving = true;
    notifyListeners();

    if(alerta.id == null){
      // es necsario crear
      await crearAlerta(alerta);
    }
    else{
      // ya existe, actualizar
      await updateAlerta(alerta);
    }

    // Avisar a cualquier componente que este utilizando isSaving que esta en false
    isSaving = false;
    notifyListeners();
  }
  

  // Metodo para crear una nueva alerta
  Future crearAlerta(Alertas alerta) async {
    final url = Uri.https(_baseUrl,'alertas.json');
    print(alerta.toJson());
    final resp = await http.post(url, body:json.encode(alerta.toJson()));
    final decodedData = json.decode(resp.body);
    alerta.id = decodedData['name'];
    alertas.add(alerta);

    return alerta.id!;
  }
  // Metodo para actualizar los datos de una alerta
  Future updateAlerta(Alertas alerta) async {
    final url = Uri.https(_baseUrl,'alertas/${alerta.id}.json');
    final resp = await http.put(url, body:alerta.toJson());
    final decodedData = json.decode(resp.body);
    alerta.id = decodedData['name'];
    alertas.add(alerta);

    return alerta.id!;
  }

}