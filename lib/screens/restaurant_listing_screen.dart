import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/screens/home_screen.dart';

class RestaurantListingScreen extends StatelessWidget {
   static const String routeName = '/restaurant-listing';

static Route route ({required List<Restaurant> restaurant}){
  return MaterialPageRoute(builder:(_) => RestaurantListingScreen(restaurant: restaurant),
  settings: RouteSettings(name: routeName));
}

  
 final List<Restaurant> restaurant;
 const RestaurantListingScreen({required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurants'),),
      body: ListView.builder(
        itemCount: restaurant.length,
        itemBuilder: ((context, index) {
          return RestaurantCard(restaurant: restaurant[index]);
        }))
    );
    
  }
}