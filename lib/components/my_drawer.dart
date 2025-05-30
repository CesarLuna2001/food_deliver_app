import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_drawer_tile.dart';
import 'package:food_deliver_app/pages/settings_page.dart';
import 'package:food_deliver_app/services/auth/auth_services.dart';

// Drawer lateral de la aplicación con navegación a Home, Settings y Logout
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // Cerrar sesión del usuario
  void logout() {
    final authService = AuthServices();  // Obtiene instancia de autenticación
    authService.signOut();               // Ejecuta el método de cierre de sesión
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background, // Color de fondo
      child: Column(
        children: [
          // Icono del logotipo o marca de la app
          Padding(
            padding: const EdgeInsets.only(top: 100.0),          // Margen superior
            child: Icon(
              Icons.lock_open_rounded,                           // Ícono
              size: 80,                                          // Tamaño
              color: Theme.of(context).colorScheme.inversePrimary, // Color
            ),
          ),

          // Separador visual
          Padding(
            padding: const EdgeInsets.all(25.0),                 // Espaciado
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,    // Color línea
            ),
          ),

          // Opción Home
          MyDrawerTile(
            text: "H O M E",                                     // Texto
            icon: Icons.home,                                    // Ícono
            onTap: () => Navigator.pop(context),                 // Cierra el drawer
          ),

          // Opción Settings
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);                            // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),    // Navega a ajustes
                ),
              );
            },
          ),

          const Spacer(),                                        // Empuja los items siguientes al fondo

          // Opción Logout
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              logout();                                          // Llama a logout
              Navigator.pop(context);                            // Cierra el drawer
            },
          ),

          const SizedBox(height: 25),                            // Espacio inferior
        ],
      ),
    );
  }
}
