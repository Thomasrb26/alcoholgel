import 'package:flutter/material.dart';
import 'package:alcoholgelutal/import.dart';
import 'package:alcoholgelutal/models/alerta.dart';
import 'package:alcoholgelutal/screens/shared/loading_screen.dart';
import 'package:alcoholgelutal/services/auth_service.dart';
import 'package:alcoholgelutal/utils/qrscan.dart';
import 'package:alcoholgelutal/widgets/widgets.dart';
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
    // print('idUsuario ' + idUsuario!);
    // Obtenemos el servicio de alertas desde el context, para utilizar conexion con API.
    final alertaService = Provider.of<AlertaService>(context);
    final authService = Provider.of<AuthService>(context);

    // Si alertaService esta cargando los elementos, mosrtramos una vista de Loading.
    if(alertaService.isLoading) return const LoadingScreen(header:'AlcoholGel Utal');

    return Scaffold(
        appBar: AppBar(
          title: const Text('AlcoholGel Utal'),
          actions: [IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },

          ),]
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              // padding: EdgeInsets.all(16.0),
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 10,
              ),
              child: Text(
                '¡Bienvenido/a ${authService.idUsuario}!', 
                style: const TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.primary
                ),
              ),
            ),
            Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tus Alertas', 
                style: TextStyle(
                  fontSize: 17, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListAlertas(alertaService: alertaService, authService: authService,),
          ],
        )
      );
  }
}

class ListAlertas extends StatelessWidget {
 
  const ListAlertas({
    Key? key,
    required this.alertaService, 
    required this.authService,
  }) : super(key: key);

  final AlertaService alertaService;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    
    final List<Alertas> alertasUser = [];
    
    for (var alerta in alertaService.alertas) {
      if(alerta.creadoPor == authService.idUsuario){
        alertasUser.add(alerta);
      }
    }
    if(alertasUser.isNotEmpty){
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount:alertasUser.length,
        itemBuilder: (context,i) =>  
          GestureDetector(
            onTap: (){
              alertaService.alertaSeleccionada = alertasUser[i].copia();
              Navigator.pushNamed(context, 'alertaExistente');
            },
            child: CardAlertaUsuario(
              edificio: alertasUser[i].edificio, 
              fecha: alertasUser[i].fechaCreacion, 
              estado: alertasUser[i].estado, 
              sala:alertasUser[i].sala, 
            ),
          )
      );
    }
    else{
      return Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.question_mark_rounded, color: Colors.grey,),
              Text(
                "No tienes alertas creadas, para crear una haz click en el botón flotante ubicado en la parte inferior para escanear un código QR.", 
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

  }
}
