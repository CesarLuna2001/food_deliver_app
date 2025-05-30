import 'package:flutter/material.dart';

// Widget reutilizable que representa un elemento (tile) en el Drawer lateral
class MyDrawerTile extends StatelessWidget {
  // Texto que se mostrará como título del tile
  final String text;
  // Icono opcional que se mostrará a la izquierda
  final IconData? icon;
  // Función opcional que se ejecuta al tocar el tile
  final void Function()? onTap;
  
  // Constructor con parámetros requeridos y opcionales
  const MyDrawerTile({
    super.key, 
    required this.text,    // Texto obligatorio
    this.icon,             // Icono opcional
    this.onTap,            // Callback opcional
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0), // Margen izquierdo para alinear
      child: ListTile(
        // Título del tile
        title: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary, // Color según tema
          ),
        ),
        // Icono que precede al título
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,   // Color del icono
        ),
        // Acción cuando el usuario toca el tile
        onTap: onTap,
      ),
    );
  }
}
