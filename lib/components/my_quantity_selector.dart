import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/food.dart';

// Widget redondo con botones + / - para ajustar la cantidad de un producto
class QuantitySelector extends StatelessWidget {
  // Cantidad actual
  final int quantity;
  // Referencia al alimento (p.ej., para lógica adicional si se requiere)
  final Food food;
  // Callback al presionar el botón de incrementar
  final VoidCallback onIncrement;
  // Callback al presionar el botón de decrementar
  final VoidCallback onDecrement;

  // Constructor
  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background, // Fondo según tema
        borderRadius: BorderRadius.circular(50.0),       // Forma circular
      ),
      padding: EdgeInsets.all(8),                        // Relleno interno
      child: Row(
        mainAxisSize: MainAxisSize.min,                  // Solo ocupa el espacio necesario
        children: [
          // Botón para disminuir la cantidad
          GestureDetector(
            onTap: onDecrement,                          // Llama al callback de decremento
            child: Icon(
              Icons.remove,                              // Ícono “-”
              size: 20,
              color: Theme.of(context).colorScheme.primary, // Color principal
            ),
          ),

          // Texto que muestra la cantidad actual
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8), // Espaciado lateral
            child: SizedBox(
              width: 20,                                 // Ancho fijo
              child: Center(
                child: Text(
                  quantity.toString(),                   // Convierte la cantidad a texto
                ),
              ),
            ),
          ),

          // Botón para aumentar la cantidad
          GestureDetector(
            onTap: onIncrement,                          // Llama al callback de incremento
            child: Icon(
              Icons.add,                                 // Ícono “+”
              size: 20,
              color: Theme.of(context).colorScheme.primary, // Color principal
            ),
          ),
        ],
      ),
    );
  }
}
