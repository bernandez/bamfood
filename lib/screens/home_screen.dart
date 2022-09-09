


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/models/category_model.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/widgets/restaurant_tags.dart';

import '../models/promo_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(builder: (_) => HomeScreen(), settings: RouteSettings(name:routeName));
  }
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding:  const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:  Category.categories.length,
                itemBuilder: (context, index) {
                  return CategoryBox(category: Category.categories[index]);
                }),
            ),
            ),
            Padding(padding:  const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:  Promo.promos.length,
                itemBuilder: (context, index) {
                  return PromoBox(promo: Promo.promos[index],);
                }),
            ),
            ),

            foodsearchbox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Top Rated", style: Theme.of(context).textTheme.headline4,)),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: Restaurant.restaurants.length,
              itemBuilder: (context, index) {
                return RestaurantCard(restaurant: Restaurant.restaurants[index]);
              }),

          ],
        ),
      )
    );
    
  }
}

class foodsearchbox extends StatelessWidget {
  const foodsearchbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "What do you want?",
              suffixIcon: Icon(Icons.search,
              color: Theme.of(context).colorScheme.primary,
              ),
              contentPadding:
                  const EdgeInsets.only(left: 20, bottom: 5, right: 5, top: 12.5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
            ),
            
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 50,
          height: 50,
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary,))
        )
      ],
    );
  }
}

class PromoBox extends StatelessWidget {
  final Promo promo;
  const PromoBox({Key? key, required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        margin: const EdgeInsets.only(right: 5),
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
          image: DecorationImage(image: NetworkImage(promo.imageUrl),
           fit: BoxFit.cover,)
    
        ),
      ),
      ClipPath(
        clipper: PromoCustomClipper(),
        child: Container(
          margin: const EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.primary,    
          ),
      
          child: Padding(
            padding: const EdgeInsets.only(top:10, left: 15, right: 125),
            child: Column(
              children: [
                 Text(promo.title, style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),),
                 SizedBox(height: 15,),
                 Text(promo.description, style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white))
      
                
              ],
            ),
          ),
      
        
        ),
      ),
      

      ],
    );
    
  }
}

class PromoCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(225, size.height);
    path.lineTo(275, 0);

    return path;
    
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
   return false;
    
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children:[ Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
              image:DecorationImage(image: NetworkImage(restaurant.imageUrl),
              fit: BoxFit.cover),
              )
            ),
            Positioned(
              top:10,
              right: 10,
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('${restaurant.deliveryTime} min',style: Theme.of(context).textTheme.bodyText1,)),
              ),
            )
        ],),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text(restaurant.name,style: Theme.of(context).textTheme.headline5,),
        SizedBox(height: 5,),
        // Text('${restaurant.tags}'),
  
        RestaurantTags(restaurant: restaurant),
        SizedBox(height: 5,),
  
        Text('${restaurant.distance}km- \$${restaurant.deliveryFee} delivery',style: Theme.of(context).textTheme.bodyText1,)
  
    ],
  ),
)

        ],
      ),
    );
    
  }
}



class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Stack(children: [
        Positioned(
          top: 10,
          left:10,
          child: Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            // color: Colors.white,
            child: Image.asset(category.imageUrl),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(category.name, style: Theme.of(context).textTheme.headline5!.copyWith(color:Colors.white))),
        )


      ]),
    );
    
  }
}

class CustomBar extends StatelessWidget with PreferredSizeWidget {
  const CustomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('current Location',
          style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),),
          Text('calembar street',
          style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
          ),

        ],
      )
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}

