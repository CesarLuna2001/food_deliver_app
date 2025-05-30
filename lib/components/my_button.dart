import 'package:flutter/material.dart';

// Un widget personalizado que representa un botón reutilizable
class MyButton extends StatelessWidget {
  // Callback opcional que se ejecuta cuando se toca el botón
  final Function()? onTap;
  // Texto que se mostrará dentro del botón
  final String text;

  // Constructor con llave opcional de Flutter y parámetros requeridos
  const MyButton(
    {super.key, 
    required this.onTap,
    required this.text}
    );

  @override
  Widget build(BuildContext context) {
    // Detecta gestos de toque sobre su hijo
    return GestureDetector(
      // Acción a ejecutar cuando se detecta el toque
      onTap: onTap,
      // Contenedor que define la apariencia del botón
      child: Container(
        // Espaciado interno
        padding: const EdgeInsets.all(25.0),
        // Margen horizontal alrededor del botón
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        // Decoración: color de fondo y bordes redondeados
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,        // Color primario del tema
          borderRadius: BorderRadius.circular(8.0),            // Radio de 8 px para las esquinas
        ),
        // Centra el texto dentro del contenedor
        child: Center(
          child: Text(
            text,                                              // Texto a mostrar
            style: TextStyle(
              fontWeight: FontWeight.bold,                     // Texto en negritas
              color: Theme.of(context).colorScheme.inversePrimary, // Color inverso del tema para contraste
              fontSize: 16.0                                   // Tamaño de fuente
            ),
          )
        ),
      )
    );
  }
}
