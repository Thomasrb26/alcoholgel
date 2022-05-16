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
    final url = Uri.https(_baseUrl, 'alertas.json');
    final resp = await http.get(url);

    final Map<String,dynamic> alertasMap = json.decode(resp.body);

    print(alertasMap);
  }

}