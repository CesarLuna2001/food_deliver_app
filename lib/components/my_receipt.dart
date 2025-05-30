import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:provider/provider.dart';

// Widget que muestra un recibo de compra y mensaje de agradecimiento
class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50), // Margen externo
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centra verticalmente
          children: [
            const Text("Thank you for your order!"),  // Mensaje de agradecimiento
            const SizedBox(height: 25),                // Espacio vertical

            // Caja con borde que contiene el recibo generado
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary // Color del borde
                ),
                borderRadius: BorderRadius.circular(8), // Bordes redondeados
              ),
              padding: const EdgeInsets.all(25),      // Relleno interno

              // Escucha cambios en el modelo Restaurant para mostrar el recibo
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) =>
                  Text(restaurant.displayCartReceipt()), // Texto con detalle del pedido
              ),
            ),

            const SizedBox(height: 25),                // Espacio vertical

            // Mensaje con tiempo estimado de entrega
            const Text("Estimated delivery time is: 4:10pm")
          ],
        ),
      ),
    );
  }
}
