import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:alcoholgelutal/models/models.dart';
import 'package:http/http.dart' as http;

/// Servicio para conexion con firabase, especificamente para la API 
/// de alertas. Aca se definen metodos para obtener, crear, actualizar y 
/// eliminar alertas.
class AlertaService extends ChangeNotifier {

  final String _baseUrl = 'alcoholgel-app-utal-default-rtdb.firebaseio.com';
  final List<Alertas> alertas = [];

  late Alertas alertaSeleccionada;

  bool isLoading = true;
  bool isSaving = false;
  AlertaService(){
    cargarAlertas();
  }

  /// Metodo para obtener alertas desde Firebase y cargarlas a la aplicacion
  /// mediante el uso de la variables alertas.
  Future cargarAlertas() async {

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'alertas.json');
    final resp = await http.get(url);

    
    final Map<String,dynamic> alertasMap = json.decode(resp.body);
    if(alertasMap != null){
      alertasMap.forEach((key, value) {
        final tempAlerta = Alertas.fromJson(value);
        tempAlerta.id = key;
        alertas.add(tempAlerta);
      });
    }
    isLoading = false;
    notifyListeners();

  }


  /// Metodo reutilizable para actualiza o crear una alerta, dependiendo si
  /// existe un id de firabase ligada a ella. Si no existe, se considera que es
  /// una nueva alerta, de lo contrario ya existe y solo se actualiza.
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
  

  /// Metodo para crear una nueva alerta
  Future crearAlerta(Alertas alerta) async {
    final url = Uri.https(_baseUrl,'alertas.json');
    final resp = await http.post(url, body:json.encode(alerta.toJson()));
    final decodedData = json.decode(resp.body);
    alerta.id = decodedData['name'];
    alertas.add(alerta);
    return alerta.id!;
  }
  /// Metodo para actualizar los datos de una alerta
  Future updateAlerta(Alertas alerta) async {
    final url = Uri.https(_baseUrl,'alertas/${alerta.id}.json');
    final resp = await http.put(url, body:json.encode(alerta.toJson()));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    alerta.id = decodedData['name'];
    // return alerta.id!;
  }
  Future deleteAlerta(String? id) async {
    final url = Uri.https(_baseUrl,'alertas/$id.json');
    final resp = await http.delete(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    // alerta.id = decodedData['name'];
    // return alerta.id!;
  }

}