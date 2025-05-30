import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_current_location.dart';
import 'package:food_deliver_app/components/my_description_box.dart';
import 'package:food_deliver_app/components/my_drawer.dart';
import 'package:food_deliver_app/components/my_food_tile.dart';
import 'package:food_deliver_app/components/my_sliver_app_bar.dart';
import 'package:food_deliver_app/components/my_tab_bar.dart';
import 'package:food_deliver_app/models/food.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:food_deliver_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // Controlador para manejar las pestañas (tabs)
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de tabs con la cantidad de categorías de comida
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // Libera el controlador cuando el widget se destruya para evitar fugas de memoria
    _tabController.dispose();
    super.dispose();
  }

  // Método privado para filtrar la lista completa de alimentos según la categoría dada
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Genera una lista de widgets que muestra la comida agrupada por categoría
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {
      // Filtra el menú para obtener solo los alimentos de la categoría actual
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      // Construye una lista de elementos para esa categoría
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(), // Previene el scroll independiente dentro del TabBarView
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          // Obtiene un alimento individual
          final food = categoryMenu[index];

          // Devuelve el widget de cada alimento con la funcionalidad para ir a la página de detalles
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(), // Menú lateral deslizable
      body: NestedScrollView(
        // Construcción del SliverAppBar con un header flexible
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController), // Pestañas para categorías
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25, 
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // Widget personalizado para mostrar la ubicación actual
                MyCurrentLocation(),

                // Widget con la descripción o detalles adicionales
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        // El cuerpo que cambia según la pestaña seleccionada, escuchando al proveedor Restaurant
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            // Para cada tab, muestra la lista de comidas filtradas según la categoría
            children: getFoodInThisCategory(restaurant.menu),
          ),
        )
      ),
    );
  }
}
