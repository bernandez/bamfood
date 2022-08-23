import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/basket_screen.dart';
import 'package:food_delivery_app/screens/delivery_time_screen.dart';
import 'package:food_delivery_app/screens/edit_basket_screen.dart';
import 'package:food_delivery_app/screens/filter_screen.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';
import 'package:food_delivery_app/screens/restaurant_details_screen.dart';
import 'package:food_delivery_app/screens/voucher_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('the route is: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();  
      case FilterScreen.routeName:
        return FilterScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route();

      default:
        return _errorRoute();
         
    }

  }


  static Route _errorRoute(){
    return MaterialPageRoute(builder: (_) => Scaffold(appBar: AppBar(title: Text('error'),),), settings: RouteSettings(name:'/error'));
  }
}