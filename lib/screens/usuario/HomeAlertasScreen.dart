import 'package:flutter/material.dart';

class HomeAlertasScreen extends StatelessWidget {

  const HomeAlertasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Alertas'),
        elevation: 0,
      ),
      body: const Center(
        child: Text('HomeAlertasScreen'),
      ),
    );
  }
}
