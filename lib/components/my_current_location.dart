import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:provider/provider.dart';

// Widget que muestra y permite modificar la dirección de entrega actual
class MyCurrentLocation extends StatelessWidget {
  // Constructor sin parámetros adicionales
  MyCurrentLocation({super.key});

  // Controlador para leer/escribir texto en el cuadro de diálogo
  final TextEditingController textController = TextEditingController();

  // Muestra un diálogo para introducir o editar la dirección
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Location"),          // Título del diálogo
        content: TextField(
          controller: textController,                // Controlador del texto
          decoration: InputDecoration(
            hintText: "Enter Address...",            // Texto sugerido
          ),
        ),
        actions: [
          // Botón Cancelar
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);                // Cierra el diálogo
              textController.clear();                // Limpia el campo de texto
            },
            child: const Text("Cancel"),
          ),

          // Botón Guardar
          MaterialButton(
            onPressed: () {
              // Obtiene la dirección introducida
              String newAddress = textController.text;
              // Actualiza la dirección en el provider Restaurant
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);                // Cierra el diálogo
              textController.clear();                // Limpia el campo de texto
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),           // Margen interno
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Etiqueta “Deliver Now”
          Text(
            "Deliver Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary, // Color primario
            ),
          ),
          // Área que muestra la dirección y abre el diálogo al pulsar
          GestureDetector(
            onTap: () => openLocationSearchBox(context),    // Acción al tocar
            child: Row(
              children: [
                // Dirección actual obtenida del provider
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAdress,              // Dirección
                    style: TextStyle(
                      color:
                          Theme.of(context).colorScheme.inversePrimary, // Color inverso
                      fontWeight: FontWeight.bold,           // Texto en negritas
                    ),
                  ),
                ),
                // Icono de flecha desplegable
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
