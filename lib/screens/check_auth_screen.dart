import 'package:flutter/material.dart';
import 'package:alcoholgelutal/import.dart';
import 'package:alcoholgelutal/services/auth_service.dart';

class CheckAuthScreen extends StatelessWidget {
   
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.getDataUser(),
          builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {

            if (!snapshot.hasData) {
              return const Text('Espere');
            }
            if(snapshot.data?['rol'] == ''){
              Future.microtask(() {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginPage(),
                    transitionDuration: const Duration(seconds: 0)
                    )
                );
              });
            }
            else{

              authService.idUsuario = snapshot.data?['userId'];
              // authService.setIdUsuario(snapshot.data?['userId']);

              if(snapshot.data?['rol'] == '0'){
                Future.microtask(() {
                  Navigator.pushReplacement(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomeFuncionarioScreen(),
                      transitionDuration: const Duration(seconds: 0)
                      )
                  );
                });
              }
              else{
                Future.microtask(() {
                  Navigator.pushReplacement(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const MisAlertasScreen(),
                      transitionDuration: const Duration(seconds: 0)
                    )
                  );
                });
              }
            }

            return Container();

          }
        )
      ),
    );
  }
}