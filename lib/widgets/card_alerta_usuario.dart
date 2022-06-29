import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/app_theme.dart';

///Widget que representa un elemento en la lista de alertas existentes del usuario.
///Muestra informacion de la alerta, como el titulo, fecha, el estado actual y un par de iconos.
class CardAlertaUsuario extends StatelessWidget {
  final String fecha;
  final String estado;
  final String sala;
  final String edificio;

  const CardAlertaUsuario(
      {Key? key,
      required this.fecha,
      required this.estado,
      required this.sala,
      required this.edificio})
      : super(key: key);

  // Metodo para definir el color de fondo del widget para mostrar el estado.
  Color switchColorEstado() {
    switch (estado) {
      case 'Nueva':
        return Colors.red;
      case 'Aceptada':
        return Colors.orange;
      case 'Completada':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.qr_code,
              size: 40,
              color: AppTheme.primary,
            ),
            title: Text('Dispensador ' + edificio + ' ' + sala),
            subtitle: Text(fecha),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                decoration: BoxDecoration(
                  color: switchColorEstado(),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    child: Text(
                      estado,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontSize: 14),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.arrow_forward_ios)
            ]),
          )
        ],
      ),
    );
  }
}
