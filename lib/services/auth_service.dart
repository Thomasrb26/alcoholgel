
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier {

  final _baseUrl = 'alcoholgel-app-utal-default-rtdb.firebaseio.com';
  String idUsuario = '';

  final storage = const FlutterSecureStorage();

  Future<String?> agregarUsuario(String id, int rol) async {

    final url = Uri.https(_baseUrl, 'usuarios.json');
    final Map<String, dynamic> dataUsuario = {
      'rol':rol,
      'id':id
    };
    final resp = await http.post(url, body:json.encode(dataUsuario));
    final decodedData = json.decode(resp.body);
    // print(decodedData['name']);
    await storage.write(key: 'userId', value: id);
    await storage.write(key: 'rol', value: rol.toString());
    await storage.write(key: 'keyId', value: decodedData['name']);
    return id;

  }

  Future logout() async{
    await storage.delete(key: 'userId');
    await storage.delete(key: 'rol');
    return;
  }

  Future<String> readUserRol() async{
    return await storage.read(key: 'rol') ?? '';
  } 
  Future<String> readUserId() async{
    return await storage.read(key: 'userId') ?? '';
  } 
  
  Future<Map<String, dynamic>> getDataUser() async{
    Map<String, dynamic> dataUserStore = {
      'rol':'',
      'userId':''
    };
    dataUserStore['rol'] = await storage.read(key: 'rol') ?? '';
    dataUserStore['userId'] =  await storage.read(key: 'userId') ?? '';
    return dataUserStore;
  }

  void setIdUsuario(String id){
    print('setando id user '+id);
    idUsuario = id;
    notifyListeners();
  }
}