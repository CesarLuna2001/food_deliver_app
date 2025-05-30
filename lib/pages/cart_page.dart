import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/components/my_cart_tile.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:food_deliver_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

// Pantalla que muestra el carrito de compras usando el estado de Restaurant
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(  // Escucha cambios en el modelo Restaurant
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;  // Obtiene los items en el carrito

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),  // Título de la app bar
            backgroundColor: Colors.transparent,  // Fondo transparente
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,  // Color del texto/iconos
            actions: [
              // Botón para limpiar el carrito
              IconButton(
                onPressed: () {
                  // Muestra un diálogo para confirmar vaciar carrito
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        // Botón cancelar: cierra el diálogo
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel")
                        ),
                        // Botón sí: limpia el carrito y cierra diálogo
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes")
                        )
                      ],
                    )
                  );
                },
                icon: Icon(Icons.delete),  // Ícono de papelera
              )
            ],
          ),
          body: Column(
            children: [
              // Lista de items en el carrito
              Expanded(
                child: Column(
                  children: [
                    // Si el carrito está vacío muestra mensaje centrado
                    userCart.isEmpty 
                    ? const Expanded(
                      child: Center(
                        child: Text("Cart is empty...")
                      )
                    ) 
                    // Si hay items muestra lista scrollable con tiles de cada item
                    : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          final cartItem = userCart[index];  // Item actual
                          return MyCartTile(cartItem: cartItem);  // Tile personalizado
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Botón para ir a página de pago
              MyButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage()
                  )
                ), 
                text: "Go to checkout",
              ),

              const SizedBox(height: 25),  // Espacio inferior
            ],
          ), 
        );
      }
    );
  }
}
