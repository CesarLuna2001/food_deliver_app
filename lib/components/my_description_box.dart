import 'package:flutter/material.dart';

// Widget que muestra información resumida sobre tarifa y tiempo de entrega
class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Estilo principal de texto (color inverso del tema)
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    // Estilo secundario de texto (color primario del tema)
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary, // Borde con color secundario
        ),
        borderRadius: BorderRadius.circular(20.0),        // Bordes redondeados
      ),
      padding: const EdgeInsets.all(25.0),                // Relleno interno
      margin: const EdgeInsets.only(
        left: 25.0, right: 25.0, bottom: 25.0),           // Margen externo
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribución horizontal
        children: [
          // Columna para la tarifa de envío
          Column(
            children: [
              Text('\$0.99', style: myPrimaryTextStyle),    // Monto de la tarifa
              Text('Delivery Fee', style: mySecondaryTextStyle), // Etiqueta
            ],
          ),

          // Columna para el tiempo estimado de entrega
          Column(
            children: [
              Text('15-30 min', style: myPrimaryTextStyle), // Tiempo estimado
              Text('Delivery Time', style: mySecondaryTextStyle), // Etiqueta
            ],
          ),
        ],
      ),
    );
  }
}
