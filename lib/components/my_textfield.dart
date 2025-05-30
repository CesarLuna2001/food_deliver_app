import 'package:flutter/material.dart';

// Widget personalizado que crea un campo de texto con controlador, estilo y opción de ocultar texto
class MyTextField extends StatelessWidget {
  // Controlador para manejar el texto ingresado
  final TextEditingController controller;
  // Texto que aparece como pista dentro del campo cuando está vacío
  final String hintText;
  // Booleano para indicar si el texto debe ocultarse (p.ej., para contraseñas)
  final bool obscureText;

  // Constructor que requiere controlador, texto hint y configuración de ocultación
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0), // Margen horizontal externo
      child: TextField(
        controller: controller,  // Control del texto
        obscureText: obscureText, // Si el texto debe ocultarse

        decoration: InputDecoration(
          // Borde cuando el campo no está enfocado
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary, // Color del borde
            ),
          ),

          // Borde cuando el campo está enfocado
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary, // Color del borde enfocado
            ),
          ),

          // Texto de ayuda que se muestra cuando el campo está vacío
          hintText: hintText,

          // Estilo del texto de ayuda
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary, // Color del texto hint
          ),
        ),
      ),
    );
  }
}
