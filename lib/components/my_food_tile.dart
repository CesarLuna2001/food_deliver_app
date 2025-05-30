import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/food.dart';

// Widget que representa un elemento de comida en la lista
class FoodTile extends StatelessWidget {
  // Modelo con la información de la comida
  final Food food;
  // Callback opcional al tocar el elemento
  final Function()? onTap;

  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Área táctil que envuelve el contenido
        GestureDetector(
          onTap: onTap,                             // Ejecuta el callback si se toca
          child: Padding(
            padding: const EdgeInsets.all(15.0),   // Relleno interno
            child: Row(
              children: [
                // Columna con nombre, precio y descripción
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre del platillo
                      Text(food.name),
                      // Precio del platillo
                      Text(
                        '\$' + food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, // Color destacado
                        ),
                      ),
                      const SizedBox(height: 10),      // Espacio vertical
                      // Descripción del platillo
                      Text(
                        food.description,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.inversePrimary, // Color secundario
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),             // Espacio entre texto e imagen

                // Imagen del platillo con bordes redondeados
                ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Radio de 8 px
                  child: Image.asset(
                    food.imagePath,                      // Ruta de la imagen
                    height: 120,                         // Altura fija
                  ),
                ),
              ],
            ),
          ),
        ),

        // Línea divisoria inferior
        Divider(
          color: Theme.of(context).colorScheme.tertiary, // Color de la línea
          endIndent: 25,      // Espacio a la derecha
          indent: 25,         // Espacio a la izquierda
        ),
      ],
    );
  }
}
