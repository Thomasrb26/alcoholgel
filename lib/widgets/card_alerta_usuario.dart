import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/app_theme.dart';

class CardAlertaUsuario extends StatelessWidget {

  final String fecha;
  final String estado;
  final String sala;
  final String edificio;

  const CardAlertaUsuario({Key? key,
    required this.fecha, 
    required this.estado, 
    required this.sala, 
    required this.edificio}
  ) : super(key: key);

  Color switchColorEstado(){

    switch (estado) {
      case 'pendiente':
        return Colors.red;
      case 'en camino':
        return Colors.orange;
      case 'completado':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Icon switchIconAlerta() {
    switch (estado) {
      case 'pendiente':
        return const Icon(
          Icons.timer,
          size: 40,
          color: Color.fromARGB(255, 235, 213, 11),
        ) ;
      case 'en camino':
        return  const Icon(
          Icons.directions_walk,
          size: 40,
          color: Colors.blueGrey,
        ) ;
      case 'completado':
        return const Icon(
          Icons.check,
          size: 40,
          color: Colors.green,
        ) ;
      default:
        return const Icon(
          Icons.timer_outlined,
          size: 40,
        ) ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            // leading: switchIconAlerta(),
            leading: const Icon(
              Icons.qr_code,
              size: 40,
              color: AppTheme.primary,
            ) ,
            title: Text('Dispensador '+edificio+sala),
            subtitle: Text(fecha),
            // ignore: prefer_const_literals_to_create_immutables
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Container(
                decoration: BoxDecoration(
                  color: switchColorEstado(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(estado, 
                    style: const TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.w900 ,
                      fontStyle: FontStyle.italic,
                      fontSize: 14
                    ),
                  )
                ),
              ),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_forward_ios)
            ]),
          )
        ],
      ),
    );
  }
}