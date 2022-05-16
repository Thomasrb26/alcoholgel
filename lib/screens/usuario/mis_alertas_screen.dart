import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/qrscan.dart';
import 'package:flutter_application_1/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../../services/services.dart';

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

    String _barcode = '';
    final alertaService = Provider.of<AlertaService>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mis alertas'),
          backgroundColor: Colors.red[900],
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              QrScan.scan(_barcode);
              // Navigator.pushNamed(context, 'scanqr');
            },
            child: const Icon(Icons.qr_code_scanner_sharp, size:35,),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              
              Navigator.pushNamed(context, 'alertaInfo');
            },
            child: const Icon(Icons.insert_drive_file_rounded,size:35,),
          ),
          
          ] 
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
