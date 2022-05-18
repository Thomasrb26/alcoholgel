// import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class QrScan {
  
  static Future scan(String _barcode) async {
  // String _barcode = "";
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      String qrResult = barcode.rawContent;
      _barcode = qrResult;
      print("QR:" + _barcode);
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
  }
}

// class QrScanState extends State<QrScan> {
//   String _barcode = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Lector QR flutter'),
//           backgroundColor: Colors.red,
//         ),
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10.0),
//                 child: RaisedButton(
//                   color: Colors.red,
//                   textColor: Colors.black,
//                   splashColor: Color.fromARGB(255, 180, 204, 216),
//                   onPressed: scan,
//                   child: const Text('Scanear el código QR.'),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
//                 child: Text(
//                   _barcode,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

