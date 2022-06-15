
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/providers/alerta_form_provider.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/input_comentario.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/select_tipo_data.dart';
import 'package:flutter_application_1/services/alerta_service.dart';
import 'package:flutter_application_1/utils/fetch.dart';
import 'package:flutter_application_1/utils/qrscan.dart';
import 'package:provider/provider.dart';
class AlertaInfoScreen extends StatelessWidget {



  const AlertaInfoScreen({Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final alertaService = Provider.of<AlertaService>(context);

    return ChangeNotifierProvider(
      create: (_) => AlertaFormProvider(Alertas(
        activa: true, 
        creadoPor: "user", 
        edificio: QrScan.jsonBarCode['edificio'], 
        // edificio: 'edificio ej', 
        encargado: '', 
        estado: "pendiente", 
        fechaCreacion: DateTime.now().toString(), 
        sala:  QrScan.jsonBarCode['sala'], 
        // sala:  'Sala1', 
        comentario: '', 
        tipoAlerta: 'Falta Alcohol'
      )),
      child: _AlertaInfo(alertaService: alertaService)
      );
  }
}

class _AlertaInfo extends StatelessWidget {
  const _AlertaInfo({
    Key? key, required this.alertaService,
  }) : super(key: key);
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
                    ListTile(
                      leading: const Text('Edificio', 
                      style: TextStyle(fontSize: 17),
        
                      ),
                      trailing: Text(alerta.edificio,
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Text('Sala', 
                      style: TextStyle(fontSize: 17),
                      ),
                      trailing: Text(alerta.sala,
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
                    const InputComentario(
                      // labelText: 'Comentario',
                      hintText: 'Escribe tu Comentario',
                      formProperty: 'comentario', 
                      // formValues: formValues
                    ),
                    const SizedBox(height: 40,),
                    ElevatedButton(
                      // onPressed:enviarAlertaDb,
                      onPressed: () async {
                        await alertaService.crearAlerta(alerta);
                        Navigator.pushNamed(context, 'vista_alertas');
                      } ,
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

