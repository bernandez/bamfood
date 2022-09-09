// TODO Implement this library.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.name, style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Theme.of(context).accentColor,
          ),
          ),
          SizedBox(height: 10,),
          RestaurantTags(restaurant: restaurant),
          SizedBox(height: 5,),
          Text('${restaurant.distance}km- \$${restaurant.deliveryFee} delivery', style: Theme.of(context).textTheme.headline3!.copyWith(
            color: Theme.of(context).accentColor,
          ),
          ),
          SizedBox(height: 5,),
          Text('Restaurant Information', style: Theme.of(context).textTheme.headline5!,
          ),
          SizedBox(height: 5,),
          Text('Restaurant Information', style: Theme.of(context).textTheme.bodyText1,
          ),

          
        ],
      ),
    );
    
  }
}