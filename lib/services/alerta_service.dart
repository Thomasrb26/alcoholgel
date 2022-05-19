import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:http/http.dart' as http;

class AlertaService extends ChangeNotifier {

  final String _baseUrl = 'alcoholgel-app-utal-default-rtdb.firebaseio.com';
  final List<Alertas> alertas = [];

  bool isLoading = true;

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

}