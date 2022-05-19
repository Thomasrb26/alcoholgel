import 'package:flutter/material.dart';

class CardAlertaUsuario extends StatelessWidget {



  const CardAlertaUsuario({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.run_circle_outlined,
              size: 45,
            ),
            title: const Text("Dispensador 1"),
            subtitle: const Text('20/10/2022'),
            // ignore: prefer_const_literals_to_create_immutables
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text('Pendiente', 
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.w900 ,
                      fontStyle: FontStyle.italic,
                      fontSize: 14
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_forward_ios)
            ]),
          )
        ],
      ),
    );
  }
}