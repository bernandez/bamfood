import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/geolocation/autocomplete/bloc/autocomplete_bloc.dart';
import 'package:food_delivery_app/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/theme.dart';
import 'package:food_delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:food_delivery_app/repositories/places/place_repository.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/location/location_screen.dart';
import 'package:food_delivery_app/screens/restaurant_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers:[
        RepositoryProvider<GeolocationRepository>(create: (_)=> GeolocationRepository()),
        RepositoryProvider<PlacesRepository>(create: (_)=> PlacesRepository(),
        )
      ], 
      child: MultiBlocProvider(
        providers:[
          BlocProvider(create: ((context) => GeolocationBloc(geolocationRepository:
           context.read<GeolocationRepository>())..add(LoadGeolocation()))),
          BlocProvider(create: ((context) => AutocompleteBloc(placesRepository:
           context.read<PlacesRepository>())..add(LoadAutocomplete())))
        ],
        child: MaterialApp(
        title: 'Food delivery',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RestaurantDetailsScreen.routeName,
        
          ),
      )
    );
    
    
  }
}

