import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/food.dart';

// Widget que crea una barra de pestañas usando un controlador de pestañas
class MyTabBar extends StatelessWidget {
  // Controlador que maneja el estado de la TabBar
  final TabController tabController;

  // Constructor que requiere el controlador
  const MyTabBar({super.key, required this.tabController});

  // Método privado que construye una lista de Tabs a partir de las categorías de comida
  List<Tab> _builCategoryTabs() {
    return FoodCategory.values.map((category) {
      // Cada tab muestra el nombre de la categoría (sin el prefijo del enum)
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,  // Controlador para manejar la selección
        tabs: _builCategoryTabs(),  // Lista de pestañas construidas dinámicamente
      ),
    );
  }
}
