// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Libreria para el escaneo del QR. 
class QrScan {
  static dynamic jsonBarCode;

  static Future scan(String _barcode, BuildContext context) async {
  // String _barcode = "";
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      String qrResult = barcode.rawContent;
      _barcode = qrResult;
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        
          _barcode = 'El usuario no dio permiso para el uso de la cámara!';
        
      } else {
        _barcode = 'Error desconocido $e';
      }
    } on FormatException {
      _barcode ='nulo, el usuario presionó el botón de volver antes de escanear algo)';
    } catch (e) {
      _barcode = 'Error desconocido : $e';
    }
    if(_barcode.isNotEmpty){ 
      jsonBarCode = jsonDecode(_barcode);
      Navigator.pushNamed(context, 'alertaInfo');
    }
  }
}

