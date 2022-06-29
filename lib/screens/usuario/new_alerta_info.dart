import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/providers/alerta_form_provider.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/input_comentario.dart';
import 'package:flutter_application_1/screens/usuario/info_alerta/select_tipo_data.dart';
import 'package:flutter_application_1/services/alerta_service.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/utils/qrscan.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

/// Vista de informacion de una alerta luego de escanear el codigo QR del dispensador.
/// En esta vista es posible elegir parametros para la alerta y luego enviarla hacia
/// la base de datos de Firebase.
class AlertaInfoScreen extends StatelessWidget {
  const AlertaInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alertaService = Provider.of<AlertaService>(context);
    final authService = Provider.of<AuthService>(context);
    final user =  authService.readUserId();
    String getDate() {
      final now = DateTime.now();
      return "${now.day}-${now.month}-${now.year}";
    }

    // Creamos mediante el provider una instancia de alerta.
    return FutureBuilder(
      future: authService.readUserId(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        if(snapshot.hasData){
          return ChangeNotifierProvider(
            create: (_) => AlertaFormProvider(
              // Creacion de una instancia de alerta.
              Alertas(
                activa: true,
                // creadoPor: "user",
                creadoPor: snapshot.data,
                edificio: QrScan.jsonBarCode['edificio'],
                encargado: '',
                estado: "Nueva",
                fechaCreacion: getDate(),
                sala: QrScan.jsonBarCode['sala'],
                comentario: '',
                tipoAlerta: 'Falta Alcohol')),
            // Luego de crear el provider con la alerta se la enviamos a la vista.
            child: _AlertaInfo(alertaService: alertaService)
          );
        }
        else{
          return const Text('Espere');
        }
      }
    );
  }
}

/// Cuerpo de la vista de alerta info
class _AlertaInfo extends StatelessWidget {
  const _AlertaInfo({
    Key? key,
    required this.alertaService,
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
        title: const Text('AlcoholGel Utal'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 150),
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(children: [
                  const ListTile(
                    leading: Icon(
                      Icons.warning_rounded,
                      color: Colors.amber,
                      size: 40,
                    ),
                    title: Text(
                      'ALERTA DISPENSADOR',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Text(
                      'Edificio',
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Text(
                      alerta.edificio,
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Text(
                      'Sala',
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Text(
                      alerta.sala,
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Selecionar tipo de alerta',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SelectTipoAlerta(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Comentario',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputComentario(
                    // labelText: 'Comentario',
                    hintText: 'Escribe tu Comentario',
                    formProperty: 'comentario',
                    // formValues: formValues
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      // onPressed:enviarAlertaDb,
                      onPressed: () async {
                        await alertaService.crearAlerta(alerta);
                        Navigator.pushNamedAndRemoveUntil(context, 'home_usuario', ModalRoute.withName('/'));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Text(
                          'Enviar Alerta',
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
