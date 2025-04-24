import 'package:flutter/material.dart';
import 'package:food_deliver_app/models/food.dart';

class Restaurant with ChangeNotifier {

  //List of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Two Burgers", 
      description: "Two burgers with cheese, lettuce, and tomato",
      imagePath: "lib/images/HAM1.png", 
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
      imagePath: "lib/images/HAM2.png", 
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
      imagePath: "lib/images/HAM3.png", 
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
      imagePath: "lib/images/HAM4.png", 
      price: 2.99, 
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
      imagePath: "lib/images/HAM5.png", 
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
      imagePath: "lib/images/SAL1.png", 
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
      imagePath: "lib/images/SAL2.png", 
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
      imagePath: "lib/images/SAL3.png", 
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
      imagePath: "lib/images/SAL4.png", 
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
      imagePath: "lib/images/SAL5.png", 
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
      imagePath: "lib/images/SIDE3.jpg", 
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
      imagePath: "lib/images/SIDE1.jpg",
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
      imagePath: "lib/images/SIDE2.jpg",
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
      imagePath: "lib/images/SIDE4.jpg",
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
      imagePath: "lib/images/SIDE5.jpg",
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
      imagePath: "lib/images/DES5.jpg",
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
      imagePath: "lib/images/DES2.jpg",
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
      imagePath: "lib/images/DES1.jpg",
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
      imagePath: "lib/images/DES3.jpg",
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
      imagePath: "lib/images/DES4.jpg",
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
      imagePath: "lib/images/DRI5.jpg",
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
      imagePath: "lib/images/DRI4.jpg",
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
      imagePath: "lib/images/DRI3.jpg",
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
      imagePath: "lib/images/DRI2.jpg",
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
      imagePath: "lib/images/DRI1.png",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.50),
        Addon(name: "Whiped", price: 0.75),
        Addon(name: "Chocolate", price: 1.00),
      ]
    ),
  ];	

  /*

  G E T T E R S

  */

  List<Food> get menu => _menu;

  /* 

  O P E R A T I O N S

  */

  //add to cart 

  //remove from cart

  //get total price of cart

  //get total items in cart

  //clear cart

  /* 

  H E L P E R S

  */

  //generate a recipt 

  //format double value late money
  
  //format list of addons into a string summary   
}