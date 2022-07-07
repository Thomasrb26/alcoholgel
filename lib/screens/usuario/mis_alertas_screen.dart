import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/shared/loading_screen.dart';
import 'package:flutter_application_1/utils/qrscan.dart';
import 'package:flutter_application_1/themes/app_theme.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../services/services.dart';

///Vista principal del usuario general. Se muestran las alertas existentes en base
///de datos para el usuario. Contiene un boton flotante para escanear codigo QR
class MisAlertasScreen extends StatelessWidget {

  const MisAlertasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Variable para guardar la informacion del codigo QR.
    String _barcode = '';

    // Obtenemos el servicio de alertas desde el context, para utilizar conexion con API.
    final alertaService = Provider.of<AlertaService>(context);

    // Si alertaService esta cargando los elementos, mosrtramos una vista de Loading.
    if(alertaService.isLoading) return const LoadingScreen(header:'Mis Alertas');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mis alertas'),
        ),

          // body: ListView.separated(
          //   itemCount: historial.length,
          //   itemBuilder: (context, index) => ListTile(
          //     title: Text(historial[index]),
          //     trailing: const Icon(Icons.add_task, color: Colors.lightGreen),
          //     onTap: () {},
          //   ),
          //   separatorBuilder: (_, __) => const Divider(),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              QrScan.scan(_barcode, context);
              // Navigator.pushNamed(context, 'alertaInfo');
            },
            child: const Icon(Icons.qr_code_scanner_sharp, size:35,),
          ), 
          ] 
        ),
        //Lista de alertas para el usuario.
        body: ListAlertas(alertaService: alertaService)
      );
  }
}

class ListAlertas extends StatelessWidget {
  const ListAlertas({
    Key? key,
    required this.alertaService,
  }) : super(key: key);

  final AlertaService alertaService;

  @override
  Widget build(BuildContext context) {

    if(alertaService.alertas.isNotEmpty){
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        itemCount: alertaService.alertas.length,
        itemBuilder: (context,i) =>  
          GestureDetector(
            onTap: (){
              alertaService.alertaSeleccionada = alertaService.alertas[i].copia();
              Navigator.pushNamed(context, 'alertaExistente');
            },
            child: CardAlertaUsuario(
              edificio: alertaService.alertas[i].edificio, 
              fecha: alertaService.alertas[i].fechaCreacion, 
              estado: alertaService.alertas[i].estado, 
              sala: alertaService.alertas[i].sala, 
            ),
          )
      );
    }
    else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.question_mark_rounded, color: Colors.grey,),
            Text("No existen alertas", style: TextStyle(color: Colors.grey),),
          ],
        ),
      );
    }

  }
}
