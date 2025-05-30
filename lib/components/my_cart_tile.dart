import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_quantity_selector.dart';
import 'package:food_deliver_app/models/cart_item.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:provider/provider.dart';

// Un widget que representa cada elemento visual del carrito de compras
class MyCartTile extends StatelessWidget {
  // Modelo que contiene la comida, cantidad y complementos seleccionados
  final CartItem cartItem;

  // Constructor con key opcional de Flutter y parámetro requerido
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    // Consumer para escuchar cambios en el modelo Restaurant (provider)
    return Consumer<Restaurant>(
      // Builder obtiene el estado más reciente de Restaurant
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,   // Fondo según el tema
          borderRadius: BorderRadius.circular(8),           // Bordes redondeados
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), // Margen externo
        child: Column(
          children: [
            // Sección principal (imagen, nombre, precio, cantidad)
            Padding(
              padding: const EdgeInsets.all(8.0),           // Relleno interno
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen de la comida
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Bordes redondeados para la imagen
                    child: Image.asset(
                      cartItem.food.imagePath,              // Ruta de la imagen
                      height: 100,                          // Alto de la imagen
                      width: 100,                           // Ancho de la imagen
                    ),
                  ),
              
                  const SizedBox(width: 10),                // Espacio entre imagen y texto
              
                  // Columna con nombre, precio y selector de cantidad
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre de la comida
                      Text(cartItem.food.name),
              
                      // Precio de la comida
                      Text(
                        "\$${cartItem.food.price}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, // Color destacado
                        ),
                      ),

                      const SizedBox(height: 10),           // Separación vertical

                      // Selector para incrementar o decrementar la cantidad
                      QuantitySelector(
                        quantity: cartItem.quantity,         // Cantidad actual
                        food: cartItem.food,                 // Referencia al alimento
                        onDecrement: () {
                          // Disminuir cantidad en el carrito
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          // Aumentar cantidad en el carrito
                          restaurant.addToCart(
                            cartItem.food,
                            cartItem.selectedAddons,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Chips de complementos (addons) seleccionados
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60, // Altura dinámica
              child: ListView(
                scrollDirection: Axis.horizontal,            // Desplazamiento horizontal
                padding: const EdgeInsets.only(
                  left: 10, bottom: 10, right: 10),          // Relleno interno
                // Genera un chip por cada addon seleccionado
                children: cartItem.selectedAddons.map(
                  (addon) => Padding(
                    padding: const EdgeInsets.only(right: 8.0), // Separación entre chips
                    child: FilterChip(
                      // Contenido del chip (nombre y precio)
                      label: Row(
                        children: [
                          // Nombre del addon
                          Text(addon.name),
                          // Precio del addon
                          Text(' \$(${addon.price})'),
                        ],
                      ),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary, // Borde del chip
                        ),
                      ),
                      onSelected: (value) {},              // No hace nada al seleccionar
                      backgroundColor:
                          Theme.of(context).colorScheme.secondary, // Fondo del chip
                      labelStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary, // Color del texto
                        fontSize: 12,                           // Tamaño de fuente
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
