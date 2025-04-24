import 'package:flutter/material.dart';
import 'package:food_deliver_app/components/my_button.dart';
import 'package:food_deliver_app/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food; 
  final Map<Addon, bool> selectedAddons = {}; // Map to store selected addons

  FoodPage({super.key, required this.food});

  //initialize selected addons to be false

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          value: false, 
                          onChanged: (value) {},
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            //button -> add to cart
            MyButton(
              onTap: () {}, 
              text: "Add to Cart",
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}