// Modelo de una Alerta, autogenerado por quicktype.io para crear objetos de tipo alerta en cualquier parte del programa 
// y que informacion contiene, ademas de metodos para transformarlo a json, map etc.

import 'dart:convert';

Map<String, Alertas> alertasFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Alertas>(k, Alertas.fromJson(v)));

String alertasToJson(Map<String, Alertas> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Alertas {
  Alertas({
    required this.activa,
    required this.comentario,
    required this.creadoPor,
    required this.edificio,
    required this.encargado,
    required this.estado,
    required this.fechaCreacion,
    required this.sala,
    required this.tipoAlerta,
  });

  bool activa;
  String comentario;
  String creadoPor;
  String edificio;
  String encargado;
  String estado;
  String fechaCreacion;
  String sala;
  String tipoAlerta;
  String? id;

  factory Alertas.fromJson(Map<String, dynamic> json) => Alertas(
    activa: json["activa"],
    comentario: json["comentario"],
    creadoPor: json["creadoPor"],
    edificio: json["edificio"],
    encargado: json["encargado"],
    estado: json["estado"],
    fechaCreacion: json["fechaCreacion"],
    sala: json["sala"],
    tipoAlerta: json["tipoAlerta"],
  );

  Map<String, dynamic> toJson() => {
    "activa": activa,
    "comentario": comentario,
    "creadoPor": creadoPor,
    "edificio": edificio,
    "encargado": encargado,
    "estado": estado,
    "fechaCreacion": fechaCreacion,
    "sala": sala,
    "tipoAlerta": tipoAlerta,
  };
}
