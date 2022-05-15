import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

class MisAlertasScreen extends StatelessWidget {
  static String id = 'idMisAlertas';

  final historial = const [
    'notificacion Sala 2',
    'notificacion Sala E-1',
    'notificacion Sala S2',
    'notificacion Sala 14',
    'notificacion Sala 24'
  ];

  const MisAlertasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mis alertas'),
          backgroundColor: Colors.red[900],
          elevation: 0,
        ),
        body: ListView.separated(
          itemCount: historial.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(historial[index]),
            trailing: const Icon(Icons.add_task, color: Colors.lightGreen),
            onTap: () {},
          ),
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}




/* children: const [
          ListTile(
            leading: Icon(Icons.arrow_circle_right_sharp),
            title: Text("prueba vista usuario"),
          )
        ]
*/