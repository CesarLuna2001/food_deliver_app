import 'package:food_deliver_app/models/food.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons; // List of selected addons
  int quantity; // Quantity of the food item in the cart

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get  totalPrice {
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
