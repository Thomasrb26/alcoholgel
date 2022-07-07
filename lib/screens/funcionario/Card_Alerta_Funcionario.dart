import 'package:flutter/material.dart';
import 'package:flutter_application_1/import.dart';
import 'package:flutter_application_1/models/alerta.dart';
import 'package:flutter_application_1/screens/funcionario/tabla_info_alerta.dart';

///Widget que representa un elemento en la lista de alertas existentes del usuario.
///Muestra informacion de la alerta, como el titulo, fecha, el estado actual y un par de iconos.
class CardAlertaFuncionario extends StatefulWidget {

  final Alertas alerta;
  final Function() notifyParent;
  final int ubicacion;
  
  const CardAlertaFuncionario(
    {
      Key? key, 
      required this.alerta, 
      required this.notifyParent, 
      required this.ubicacion,
    }
  ) : super(key: key);

  @override
  State<CardAlertaFuncionario> createState() => _CardAlertaFuncionarioState();
}

class _CardAlertaFuncionarioState extends State<CardAlertaFuncionario> {
  bool _showContent = false;
  // Metodo para definir el color de fondo del widget para mostrar el estado.
  @override
  Widget build(BuildContext context) {
    
    final alertaService  = Provider.of<AlertaService>(context);

    void confirmarAccion(BuildContext context, String accion) {
      
      String nuevoEstado;

      if(accion == 'aceptar'){
        nuevoEstado='Aceptada';
      } 
      else if(accion == 'cancelar') {
        if(widget.ubicacion==2){
          nuevoEstado = 'Aceptada';
        }else{
          nuevoEstado='Nueva';
        }
      } 
      else {
        nuevoEstado='Completada';
      }
      showDialog(context: context, builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Confirmar acción"),
          content: Text('¿Estás seguro de querer $accion esta alerta?'),
          actions: [
            TextButton(
              onPressed: (){
                widget.alerta.estado = nuevoEstado;
                alertaService.updateAlerta(widget.alerta);
                setState(() {});
                widget.notifyParent();
                Navigator.pop(context);
              },
              child: const Text('Sí')
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('No')
            )
          ],
        );
      });
    }
    
    TextButton botonEliminar() {
      return TextButton(
        onPressed: () async {
          confirmarAccion(context, 'cancelar');
        } ,
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          shape: const CircleBorder(),
          fixedSize: const Size(50, 50)
        ),
        child:const Icon(Icons.cancel, color: Colors.white,) ,
      );
    }

    TextButton botonAceptar() {
      return TextButton(
        onPressed: () {
          confirmarAccion(context, 'aceptar');
        } ,

        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          fixedSize: const Size(50, 50)
        ),
        child:const Icon(Icons.push_pin, color: Colors.white,) ,
      );
    }

    TextButton botonCompletar() {
      return TextButton(
        onPressed: () async {
          confirmarAccion(context, 'completar');
        } ,
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          fixedSize: const Size(50, 50)
        ),
        child:const Icon(Icons.check, color: Colors.white,) ,
      );
    }

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.fmd_bad,
              size: 40,
              color: AppTheme.primary,
            ) ,
            title: Text(widget.alerta.tipoAlerta),
            subtitle: Text(widget.alerta.fechaCreacion),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                  _showContent = !_showContent;
                });
              },
              icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down, size: 30,
              ),
            ),
          ),
          _showContent
            ? Container(
                padding:
                    const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: Column(
                  children: [
                    const Divider(),
                    TablaInfoAlerta(alerta:widget.alerta),
                    const Divider(),
                    const SizedBox(height:10 ),
                    if(widget.ubicacion == 0) botonAceptar(),
                    if(widget.ubicacion == 1) 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          botonEliminar(),
                          botonCompletar()
                        ],
                      ),
                    if(widget.ubicacion == 2) botonEliminar(),
                    
                  ],
                ),
              )
            : Container()
        ],
      )
      
    );
  }
  
  

}

