import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_receipt.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:food_deliver_app/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // Instancia para acceder al servicio de base de datos Firestore
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    // Al inicializar el estado, obtenemos el recibo del pedido y lo guardamos en la base de datos
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior transparente
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      // Barra inferior con detalles del conductor y botones
      bottomNavigationBar: _buildBottomNavigationBar(context),

      // Cuerpo principal con widget que muestra el recibo
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  // Método que construye la barra inferior personalizada
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40), 
        ),
      ),
      padding: const EdgeInsets.all(25),

      // Fila principal que contiene la imagen del conductor, detalles y botones
      child: Row(
        children: [
          // Contenedor para el ícono circular que simula foto de perfil del conductor
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            )
          ),

          const SizedBox(width: 10),

          // Columna con nombre y rol del conductor
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cesar Luna",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text("Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Fila con botones para mensaje y llamada
          Row(
            children: [
              // Botón de mensaje con fondo circular
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary
                )
              ),

              const SizedBox(width: 10),

              // Botón de llamada con fondo circular y color verde
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                )
              ),

            ],
          )

        ],
      ),


    );
  }
}
