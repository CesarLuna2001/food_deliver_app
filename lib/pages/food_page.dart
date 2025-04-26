import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/models/food.dart';
import 'package:food_deliver_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food; 
  final Map<Addon, bool> selectedAddons = {}; // Map to store selected addons

  FoodPage(
    {super.key, 
    required this.food}){

    //initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add food to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons ) {

    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addonns 
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add food to cart
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
                //Food Image
                Image.asset(widget.food.imagePath),
            
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    //Food Name
                      Text(widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                      ),
            
                      //Food price
                      Text('\$${widget.food.price}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                        )
                      ),
            
                      const SizedBox(height: 10),
                  
                      //Food description
                      Text(widget.food.description,),
            
                      const SizedBox(height: 10),
            
            
                      //Addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      ),
            
                      const SizedBox(height: 10),
                  
                      //Addons
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
            
                            //get individual addons
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
                //button -> add to cart
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons), 
                  text: "Add to Cart",
                ),
        
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        //back button
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