import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/themes/app_theme.dart';

///Widget que representa un elemento en la lista de alertas existentes del usuario.
///Muestra informacion de la alerta, como el titulo, fecha, el estado actual y un par de iconos.
class CardAlertaFuncionario extends StatefulWidget {

  final Alertas alerta;
  final String estadoMenu;
  const CardAlertaFuncionario(
    {
      Key? key, 
      required this.alerta, 
      required this.estadoMenu,
    }
  ) : super(key: key);

  @override
  State<CardAlertaFuncionario> createState() => _CardAlertaFuncionarioState();
}

class _CardAlertaFuncionarioState extends State<CardAlertaFuncionario> {
  // Metodo para definir el color de fondo del widget para mostrar el estado.
  @override
  Widget build(BuildContext context) {

    final alertaService  = Provider.of<AlertaService>(context);

    String setChangeEstado(){
      if (widget.estadoMenu == 'Nueva') {
        return 'Aceptada';
      } else {
        return 'Completada';
      }
    }

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.fmd_bad,
              size: 40,
              color: AppTheme.primary,
            ) ,
            title: Text('Dispensador '+widget.alerta.edificio+' '+widget.alerta.sala),
            subtitle: Text(widget.alerta.fechaCreacion+' '+widget.alerta.estado),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  iconSize: 30,
                  onPressed: (){
                    widget.alerta.estado = setChangeEstado();
                    alertaService.updateAlerta(widget.alerta);
                    setState(() {});
                  }, 
                  icon: const Icon(Icons.arrow_forward ,color: Color(0xFF1362AB)))
            ]),
          )
        ],
      ),
    );
  }
}