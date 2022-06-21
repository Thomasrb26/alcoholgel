import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/screens/funcionario/Card_Alerta_Funcionario.dart';
import 'package:flutter_application_1/screens/shared/loading_screen.dart';

class HomeFuncionarioScreen extends StatefulWidget {
   
  const HomeFuncionarioScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeFuncionarioScreen> createState() => _HomeFuncionarioScreenState();
}

class _HomeFuncionarioScreenState extends State<HomeFuncionarioScreen> {
  
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

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
      } else{
        return 'Completada';
      }
    }
    
    
    
    
     //original
    List<Alertas> filtrarAlertas(){
      List<Alertas> alertasFiltradas;
      
      alertasFiltradas = listaAlertas.where((alerta) => alerta.estado == setEstadoMenu() ).toList();
      return alertasFiltradas;
    }

    // Si alertaService esta cargando los elementos, mosrtramos una vista de Loading.
    if(alertaService.isLoading) return const LoadingScreen(header:'Mis Alertas');

    const List<Widget> _widgetOptions = <Widget>[
    // 0: Alertas nuevas
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    // 1: Alertas Aceptadas
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    // 2: Alertas completadas 
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Alertas'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: Center(
        // TODO WIDGET DE LISTA DE ALERTAS 
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => 
            CardAlertaFuncionario(
              alerta: listaAlertas[index], estadoMenu: setEstadoMenu(),
            )
        ,),
      ),
    );
  }
}