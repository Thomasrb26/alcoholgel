import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/providers/alerta_form_provider.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/input_comentario.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/select_tipo_data.dart';
import 'package:flutter_application_1/services/alerta_service.dart';
import 'package:provider/provider.dart';

class AlertaInfoExistenteScreen extends StatelessWidget {
   
  const AlertaInfoExistenteScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   final alertaService = Provider.of<AlertaService>(context);

    // Creamos mediante el provider una instancia de alerta.
    return ChangeNotifierProvider(
      create: (_) => AlertaFormProvider(
        alertaService.alertaSeleccionada
      ),

      // Luego de crear el provider con la alerta se la enviamos a la vista.
      child: _AlertaInfo(alertaService: alertaService)
    );
  }
}

/// Cuerpo de la vista de alerta info
class _AlertaInfo extends StatelessWidget {
  const _AlertaInfo({
    Key? key, required this.alertaService,
  }) : super(key: key);

  // Instancia del servicio de alertas para utilizar conexion con la api.
  final AlertaService alertaService;

  @override
  Widget build(BuildContext context) {

    final alertaForm = Provider.of<AlertaFormProvider>(context);

    final alerta = alertaForm.alerta;
    
    return Scaffold(
      key: alertaForm.formKey,
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
                    TablaInfo(alerta:alerta),
                    const Divider(),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      // onPressed:enviarAlertaDb,
                      onPressed: () async {
                        await alertaService.crearAlerta(alerta);
                        Navigator.pushNamed(context, 'vista_alertas');
                      } ,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          'Eliminar Alerta',
                          style: TextStyle(fontSize: 16),
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

class TablaInfo extends StatelessWidget {

  final Alertas alerta;

  const TablaInfo({
    Key? key, required this.alerta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(),
      children: [
        TableRow(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 20),  
              child: const Text('Edificio', style: TextStyle(fontSize: 17))
            ),
            Container(padding: const EdgeInsets.only(bottom: 20), 
              child: Text(alerta.edificio,style: const TextStyle(fontSize: 17, color: Colors.grey))
            )
          ]
        ),
        TableRow(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 20),  
              child: const Text('Sala', style: TextStyle(fontSize: 17))
            ),
            Container(padding: const EdgeInsets.only(bottom: 20), 
              child: Text(alerta.sala,style: const TextStyle(fontSize: 17, color: Colors.grey))
            )
          ]
        ),
        TableRow(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 20),  
              child: const Text('Fecha Creación', style: TextStyle(fontSize: 17))
            ),
            Container(padding: const EdgeInsets.only(bottom: 20), 
              child: Text(alerta.fechaCreacion,style: const TextStyle(fontSize: 17, color: Colors.grey))
            )
          ]
        ),
        TableRow(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 20),  
              child: const Text('Tipo', style: TextStyle(fontSize: 17))
            ),
            Container(padding: const EdgeInsets.only(bottom: 20), 
              child: Text(alerta.tipoAlerta,style: const TextStyle(fontSize: 17, color: Colors.grey))
            )
          ]
        ),
        TableRow(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 20),  
              child: const Text('Estado', style: TextStyle(fontSize: 17))
            ),
            Container(padding: const EdgeInsets.only(bottom: 20), 
              child: Text(alerta.estado,style: const TextStyle(fontSize: 17, color: Colors.grey))
            )
          ]
        ),
        TableRow(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 20),  
              child: const Text('Comentario', style: TextStyle(fontSize: 17))
            ),
            Container(padding: const EdgeInsets.only(bottom: 20), 
              child: Text(alerta.comentario,style: const TextStyle(fontSize: 17, color: Colors.grey))
            )
          ]
        ),
      ],
    );
  }
}

