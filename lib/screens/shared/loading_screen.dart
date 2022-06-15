import 'package:flutter/material.dart';

/// Pantalla de carga
class LoadingScreen extends StatelessWidget {

  final String header;
  const LoadingScreen({Key? key, required this.header}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(header)),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.indigo,
        )
      ),
    );
  }
}