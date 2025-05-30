import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/models/food.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food; 
  final Map<Addon, bool> selectedAddons = {}; // Mapa para almacenar qué addons están seleccionados

  FoodPage(
    {super.key, 
    required this.food}){

    // Inicializar todos los addons como no seleccionados (false)
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }
  
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  // Método para añadir comida al carrito
  void addToCart(Food food, Map<Addon, bool> selectedAddons ) {

    // Cerrar la página actual para volver al menú
    Navigator.pop(context);

    // Formatear la lista de addons seleccionados
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // Agregar la comida al carrito con los addons seleccionados
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Imagen de la comida
                Image.asset(widget.food.imagePath),
            
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre de la comida
                      Text(widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                      ),
            
                      // Precio de la comida
                      Text('\$${widget.food.price}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                        )
                      ),
            
                      const SizedBox(height: 10),
                  
                      // Descripción de la comida
                      Text(widget.food.description,),
            
                      const SizedBox(height: 10),
            
                      // Título para la sección de addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      ),
            
                      const SizedBox(height: 10),
                  
                      // Lista de addons con checkbox
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
            
                            // Obtener el addon individual
                            Addon addon = widget.food.availableAddons[index];
                                    
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text('\$${addon.price}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              ),
                              value: widget.selectedAddons[addon], 
                              onChanged: (bool? value) {
                                // Actualizar estado del addon seleccionado
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                // Botón para agregar al carrito
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons), 
                  text: "Add to Cart",
                ),
        
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        // Botón de regreso (back) superpuesto en la parte superior izquierda
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: 
              BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
