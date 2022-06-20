import 'package:flutter/material.dart';

///Configuracion de los temas y estilos globales para la aplicacion.
class AppTheme {

  static const Color primary = Color.fromARGB(255, 171, 9, 0);

  // Tema claro, utilizado por defecto
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
      ),
      scaffoldBackgroundColor:  const Color(0xffE8E8E8),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        elevation: 5 
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primary,
          shape: const StadiumBorder(),
          elevation: 0
        )
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          ),
          
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          ),

        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), 
            topRight: Radius.circular(10)
          )
        )
      )
      );
  
  // Tema oscuro
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.black
  );

}
