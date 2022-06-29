import 'package:flutter/material.dart';

import '../../models/models.dart';

class TablaInfoAlerta extends StatelessWidget {

  final Alertas alerta;

  const TablaInfoAlerta({
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