import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        elevation: 10,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('holaaa'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }
}
