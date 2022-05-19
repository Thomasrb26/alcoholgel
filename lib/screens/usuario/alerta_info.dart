import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/screen_args.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/input_comentario.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/select_tipo_data.dart';
import 'package:flutter_application_1/utils/fetch.dart';
import 'package:flutter_application_1/utils/qrscan.dart';
class AlertaInfoScreen extends StatelessWidget {
  
  final String edificio;
  final String sala;


  const AlertaInfoScreen({Key? key, required this.edificio, required this.sala, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    
    // final args = ModalRoute.of(context)!.settings.arguments;
    // print("args" + args.toString());
    // String edificio = args!.edificio;
    print(QrScan.jsonBarCode);
    final Map<String, String> formValues = {
      'comentario':'',
      'tipo':'',
    };
    void enviarAlertaDb(){
      Fetch.httpPost({
          'activa':true,
          'creadoPor':'2',
          'edificio':'1',
          'encargado':'1',
          'estado':'pendiente',
          'fechaCreacion': '2020',
          'sala':'lab3'
      }, '/alertas.json');
    //   final response = Fetch.httpGet('alertas.json');
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //     extractedData.forEach( (id, data) {
    //   print(data);
    //  });
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Alcohol Gel App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 150),    
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.warning_rounded,
                        color: Colors.amber,
                        size: 40,
                      ),
                      title: Text(
                        'ALERTA DISPENSADOR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Text('Edificio', 
                      style: TextStyle(fontSize: 17),
        
                      ),
                      trailing: Text(QrScan.jsonBarCode['edificio'],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Text('Sala', 
                      style: TextStyle(fontSize: 17),
                      ),
                      trailing: Text(QrScan.jsonBarCode['sala'],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 30,),
                    const Text('Selecionar tipo de alerta',
                      style: TextStyle(
                        fontSize: 16, 
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const SelectTipoAlerta(),
                    const SizedBox(height: 10,),
                    const Text('Comentario',
                      style: TextStyle(
                        fontSize: 16, 
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InputComentario(
                      // labelText: 'Comentario',
                      hintText: 'Escribe tu Comentario',
                      formProperty: 'comentario', 
                      formValues: formValues
                    ),
                    const SizedBox(height: 40,),
                    ElevatedButton(
                      onPressed:enviarAlertaDb,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          'Enviar Alerta',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    )
                  ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

