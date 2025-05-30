import 'package:flutter/material.dart';
import 'package:food_deliver_app/pages/cart_page.dart';

// Widget que representa un SliverAppBar personalizado con espacio flexible y botón de carrito
class MySliverAppBar extends StatelessWidget {
  // Widget que se muestra como contenido principal del flexibleSpace (p.ej., imagen o diseño)
  final Widget child;
  // Widget que se muestra como título flexible dentro del flexibleSpace
  final Widget title;

  // Constructor que requiere child y title
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,          // Altura cuando está expandido
      collapsedHeight: 120,         // Altura cuando está colapsado
      floating: false,              // No flota al hacer scroll hacia arriba
      pinned: true,                 // Se queda visible al hacer scroll hacia arriba

      actions: [
        // Botón del carrito en la esquina superior derecha
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            // Navega a la página del carrito
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
        ),
      ],

      backgroundColor: Theme.of(context).colorScheme.background,      // Fondo del AppBar
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,  // Color del texto e íconos

      // Título simple fijo (se muestra cuando está colapsado)
      title: Text("Sunset Dinner"),

      // Área flexible con contenido y título personalizado
      flexibleSpace: FlexibleSpaceBar(
        // Contenido flexible que recibe un padding abajo
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,                   // Widget hijo flexible (imagen o diseño)
        ),

        title: title,                     // Widget que se usa como título flexible

        centerTitle: true,                // Centra el título flexible
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0), // Padding del título flexible
        expandedTitleScale: 1,            // Escala del título cuando expandido (sin cambio)
      ),
    );
  }
}
