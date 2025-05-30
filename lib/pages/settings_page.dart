import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con título "Settings" y color de fondo según el tema actual
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),

      // Color de fondo del scaffold según tema
      backgroundColor: Theme.of(context).colorScheme.background,

      // Cuerpo principal con una columna que contiene los ajustes
      body: Column(
        children: [
          Container(
            // Decoración con color secundario del tema y bordes redondeados
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),

            // Márgenes y padding para separar y dar espacio
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            padding: const EdgeInsets.all(25),

            // Fila que contiene el texto y el switch
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // Texto que indica la opción "Dark Mode"
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Switch para activar/desactivar el modo oscuro
                CupertinoSwitch(
                  // Obtiene el estado actual del modo oscuro desde el provider (sin escuchar cambios)
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,

                  // Al cambiar el switch, llama al método toggleTheme() para cambiar el tema
                  onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
