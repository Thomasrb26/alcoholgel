import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/screens/funcionario/Card_Alerta_Funcionario.dart';
import 'package:flutter_application_1/screens/shared/loading_screen.dart';
import 'package:flutter_application_1/widgets/widgets.dart';

class HomeFuncionarioScreen extends StatefulWidget {
  const HomeFuncionarioScreen({Key? key}) : super(key: key);

  @override
  State<HomeFuncionarioScreen> createState() => _HomeFuncionarioScreenState();
}

class _HomeFuncionarioScreenState extends State<HomeFuncionarioScreen> {
  int _selectedIndex = 0;

  void recargarHome() {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtenemos el servicio de alertas desde el context, para utilizar conexion con API.
    final alertaService = Provider.of<AlertaService>(context);
    List<Alertas> listaAlertas = alertaService.alertas;
    
    String setEstadoMenu(){

      if (_selectedIndex == 0) {
        return 'Nueva';
      } else if (_selectedIndex == 1) {
        return 'Aceptada';
      } else {
        return 'Completada';
      }
    }
    
    String getTitle(){
      if (_selectedIndex == 0) {
        return 'Alertas Nuevas';
      } else if (_selectedIndex == 1) {
        return 'Alertas Aceptadas';
      } else{
        return 'Alertas Completadas';
      }
    }

    //original
    List<Alertas> filtrarAlertas() {
      return listaAlertas
          .where((alerta) => alerta.estado == setEstadoMenu())
          .toList();
    }

    List<Alertas> listaFilrada = filtrarAlertas();

    // Si alertaService esta cargando los elementos, mosrtramos una vista de Loading.
    if (alertaService.isLoading) return const LoadingScreen(header: 'Mis Alertas');

    return Scaffold(
      appBar: AppBar(
        title:  const Text('Alcohol Gel UTAL'),
      ),
      bottomNavigationBar: menuNavegacion(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                getTitle(), 
                style: const TextStyle(
                  fontSize: 17, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listaFilrada.length,
              itemBuilder: (context, index) => 
                CardAlertaFuncionario(
                  alerta: listaFilrada[index], 
                  notifyParent: recargarHome, 
                  ubicacion: _selectedIndex,
                )
                // CardAcordeonAlertaScreen()
            ,),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar menuNavegacion() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add),
          label: 'Nuevas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer_sharp),
          label: 'Aceptadas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check),
          label: 'Completadas',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppTheme.primary,
      onTap: _onItemTapped,
    );
  }
}
