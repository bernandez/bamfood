
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';


class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant-details';

  static Route route({required Restaurant restaurant}){
    return MaterialPageRoute(builder: (_) => RestaurantDetailsScreen(restaurant: restaurant), settings: RouteSettings(name:routeName));
  }
  


final Restaurant restaurant;
// ignore: use_key_in_widget_constructors
const RestaurantDetailsScreen({required this.restaurant,});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Restaurant Details")),
        bottomNavigationBar: BottomAppBar(
          
          child: Container( 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    
                  )
                ),
                onPressed: () {}, child: Text('Basket'))
            ],
          ),
        ),
        
        ),
        extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
               height: 200,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 50)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurant.imageUrl),)
               ),

            ),
            RestaurantInformation(restaurant: restaurant),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
                
                shrinkWrap: true,
                itemCount: restaurant.tags.length,
                itemBuilder: ((context, index) {
                  return _buildMenuItem(restaurant, context, index);
                }
                )
                ),
            
            
          ],
        ),


      )
    );
    
  }
}

Widget _buildMenuItem(Restaurant restaurant, BuildContext context, int index){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
         child: Text(restaurant.tags[index], style: Theme.of(context).textTheme.headline3!.copyWith(
          color: Theme.of(context).colorScheme.primary,
         ),
         ),
       ),
       Column(
        children: restaurant.menuItems
        .where((menuItem) => menuItem.category == restaurant.tags[index])
        .map(
          (menuItem) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                
                  title: Text(menuItem.name,style: Theme.of(context).textTheme.headline5,),
                  subtitle: Text(menuItem.description),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                 children: [Text('\$${menuItem.price}', style: Theme.of(context).textTheme.headline5,),
                          
                          IconButton(
                            onPressed: () {}, 
                            icon: Icon(
                              Icons.add_circle,
                          color: Theme.of(context).colorScheme.primary,
                          
                 )
                 )
                 ],

                  ),
                  ),
              ),
              Divider(height: 2,)
                
          ],
        ),
        ).toList()
       )
    ],
  );
}
