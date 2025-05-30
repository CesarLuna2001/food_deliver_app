import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/cart_item.dart';
import 'package:food_deliver_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant with ChangeNotifier {

  //List of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Two Burgers", 
      description: "Two burgers with cheese, lettuce, and tomato",
      imagePath: "lib/images/burgers/HAM1.png", 
      price: 1.99, 
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    Food(
      name: "Three Burgers", 
      description: "Three burgers with cheese, lettuce, and tomato",
      imagePath: "lib/images/burgers/HAM2.png", 
      price: 2.29, 
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    Food(
      name: "Burgers with Fries", 
      description: "Burger with cheese, lettuce, and tomato. Includes fries",
      imagePath: "lib/images/burgers/HAM3.png", 
      price: 2.19, 
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    
    Food(
      name: "Three Classic Burgers", 
      description: "Three burgers with cheese, lettuce, and tomato",
      imagePath: "lib/images/burgers/HAM4.png", 
      price: 2.99, 
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),

    Food(
      name: "Morayta Burger", 
      description: "Burger with cheese, lettuce, and tomato. Includes fries",
      imagePath: "lib/images/burgers/HAM3.png", 
      price: 2.19, 
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),

    Food(
      name: "Triple Burger", 
      description: "Burger three meets, with cheese, lettuce, and tomato",
      imagePath: "lib/images/burgers/HAM5.png", 
      price: 1.99, 
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),



    //Salads
    Food(
      name: "Caesar Salad", 
      description: "Classic Caesar salad with romaine lettuce, croutons, and parmesan cheese",
      imagePath: "lib/images/salads/SAL1.png", 
      price: 2.99, 
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),

        Food(
      name: "Caesar Salad", 
      description: "Classic Caesar salad with romaine lettuce, croutons, and parmesan cheese",
      imagePath: "lib/images/salads/SAL1.png", 
      price: 2.99, 
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),

    Food(
      name: "Greek Salad", 
      description: "Fresh Greek salad with cucumbers, tomatoes, olives, and feta cheese",
      imagePath: "lib/images/salads/SAL2.png", 
      price: 2.49, 
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    Food(
      name: "Garden Salad", 
      description: "Fresh garden salad with mixed greens, tomatoes, and cucumbers",
      imagePath: "lib/images/salads/SAL3.png", 
      price: 1.99, 
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    Food(
      name: "Spinach Salad", 
      description: "Fresh spinach salad with strawberries, walnuts, and feta cheese",
      imagePath: "lib/images/salads/SAL4.png", 
      price: 2.29, 
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    Food(
      name: "Cobb Salad", 
      description: "Classic Cobb salad with grilled chicken, bacon, and blue cheese",
      imagePath: "lib/images/salads/SAL5.png", 
      price: 2.99, 
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 1.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),

    //sides
    Food(
      name: "French Fries", 
      description: "Crispy French fries with a side of ketchup",
      imagePath: "lib/images/sides/SIDE3.jpg", 
      price: 1.99, 
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ] 
    ),
    Food(
      name: "baked potato",
      description: "Baked potato with sour cream and chives",
      imagePath: "lib/images/sides/SIDE1.jpg",
      price: 2.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ]
    ),
    Food(
      name: "Coleslaw",
      description: "Creamy coleslaw with cabbage and carrots",
      imagePath: "lib/images/sides/SIDE2.jpg",
      price: 2.29,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ]
    ),
    Food(
      name: "Bread",
      description: "Freshly baked bread with butter",
      imagePath: "lib/images/sides/SIDE4.jpg",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ]
    ),
    Food(
      name: "Mac and Cheese",
      description: "Creamy mac and cheese with cheddar cheese",
      imagePath: "lib/images/sides/SIDE5.jpg",
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.50),
        Addon(name: "Bacon", price: 0.75),
        Addon(name: "Avocado", price: 1.00),
      ]
    ),

    //desserts
    Food(
      name: "Chocolate Cake",
      description: "Rich chocolate cake with chocolate frosting",
      imagePath: "lib/images/desserts/DES5.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 0.50),
        Addon(name: "Ice Cream", price: 0.75),
        Addon(name: "Whipped Cream", price: 1.00),
      ]
    ),
    Food(
      name: "Cheesecake",
      description: "Creamy cheesecake with a graham cracker crust",
      imagePath: "lib/images/desserts/DES2.jpg",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 0.50),
        Addon(name: "Ice Cream", price: 0.75),
        Addon(name: "Whipped Cream", price: 1.00),
      ]
    ),
    Food(
      name: "Ice Cream",
      description: "Chocomint ice cream with chocolate syrup and nuts",
      imagePath: "lib/images/desserts/DES1.jpg",
      price: 2.19,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 0.50),
        Addon(name: "Ice Cream", price: 0.75),
        Addon(name: "Whipped Cream", price: 1.00),
      ]
    ),
    Food(
      name: "Brownie",
      description: "Fudgy brownie with chocolate chips",
      imagePath: "lib/images/desserts/DES3.jpg",
      price: 2.29,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 0.50),
        Addon(name: "Ice Cream", price: 0.75),
        Addon(name: "Whipped Cream", price: 1.00),
      ]
    ),
    Food(
      name: "Pays de Fruits",
      description: "Fruit tart with a buttery crust and fresh fruit",
      imagePath: "lib/images/desserts/DES4.jpg",
      price: 1.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Chocolate", price: 0.50),
        Addon(name: "Ice Cream", price: 0.75),
        Addon(name: "Whipped Cream", price: 1.00),
      ]
    ),

    //drinks
    Food(
      name: "Soda",
      description: "Refreshing soda in a variety of flavors",
      imagePath: "lib/images/drinks/DRI5.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.50),
        Addon(name: "Lemon", price: 0.75),
        Addon(name: "Mint", price: 1.00),
      ]
    ),
    Food(
      name: "Tea",
      description: "Tea with lemon and mint",
      imagePath: "lib/images/drinks/DRI4.jpg",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.50),
        Addon(name: "Lemon", price: 0.75),
        Addon(name: "Mint", price: 1.00),
      ]
    ),
    Food(
      name: "Coffee",
      description: "Freshly brewed coffee with cream and sugar",
      imagePath: "lib/images/drinks/DRI3.jpg",
      price: 2.19,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.50),
        Addon(name: "Lemon", price: 0.75),
        Addon(name: "Mint", price: 1.00),
      ]
    ),
    Food(
      name: "Juice",
      description: "Freshly squeezed juice in a variety of flavors",
      imagePath: "lib/images/drinks/DRI2.jpg",
      price: 2.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.50),
        Addon(name: "Lemon", price: 0.75),
        Addon(name: "Mint", price: 1.00),
      ]
    ),
    Food(
      name: "Frappe",
      description: "Iced Frappe with whipped cream and chocolate syrup",
      imagePath: "lib/images/drinks/DRI1.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.50),
        Addon(name: "Whiped", price: 0.75),
        Addon(name: "Chocolate", price: 1.00),
      ]
    ),
  ];	

  //user cart
  final List<CartItem> _cart = [];

  //delivery adress (which user can change/update)
  String _deliveryAdress = "117a Mercedes Barrera";

  /*

  G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAdress => _deliveryAdress;

  /* 

  O P E R A T I O N S

  */


  //add to cart 
  void addToCart(Food food, List<Addon> selectedAddons){
    //See if there is a cart item already with the same food and selected addons
    CartItem? cartItem  = _cart.firstWhereOrNull((item) {
      //check if the food items are the same 
      bool isSameFood = item.food == food;

      //Check if the selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if item already exists, increase it's quantity
    if(cartItem != null){
      cartItem.quantity++;
    //oterwise, add a new item to the cart  
    }else{
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice(){
    double total = 0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.totalPrice;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total items in cart
  int getTotalItemCount(){
    int totalItemCount = 0; 

    for (CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAdress = newAddress;
    notifyListeners();
  }

  /* 

  H E L P E R S

  */

  //generate a receipt 
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to incluide up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {  
        receipt.writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $_deliveryAdress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }
  
  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }
}