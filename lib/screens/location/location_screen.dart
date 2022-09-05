import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/blocs/geolocation/autocomplete/bloc/autocomplete_bloc.dart';
import 'package:food_delivery_app/blocs/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_app/widgets/gmap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/Location';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LocationScreen(),
        settings: RouteSettings(name: routeName));
  }

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<GeolocationBloc, GeolocationState>(
              builder: (context, state) {
                if (state is GeolocationLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GeolocationLoaded) {
                  return Gmap(
                      lat: state.position.latitude,
                      lng: state.position.longitude);
                } else {
                  return Text("Something Went wrong");
                }
              },
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Container(
              height: 100,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 50,
                  ),
                  SizedBox(),
                  Expanded(
                      child: Column(
                    children: [
                      locationsearchbox(),
                      BlocBuilder<AutocompleteBloc, AutocompleteState>(
                          builder: (context, state) {
                        if (state is AutocompleteLoading) {
                          return CircularProgressIndicator();
                        } else if (state is AutocompleteLoaded) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            height: 20,
                            color: state.autocomplete.length > 0
                                ? Colors.black.withOpacity(0.6)
                                : Colors.transparent,
                            child: ListView.builder(
                                itemCount: state.autocomplete.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      state.autocomplete[index].description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: Colors.white),
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return Text('error loading');
                        }
                      })
                    ],
                  )),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 40,
              right: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: ElevatedButton(onPressed: () {}, child: Text('save')),
              ))
        ],
      ),
    );
  }
}

class locationsearchbox extends StatelessWidget {
  const locationsearchbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {

        if (state is AutocompleteLoading){
          return Center(child: CircularProgressIndicator());
        }
        else if (state is AutocompleteLoading){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "enter your location",
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              onChanged: (value) {
                context.read<AutocompleteBloc>()
                .add(LoadAutocomplete(searchinput: value));
              },
            )
            );
        }
        else{
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "enter your location",
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
              ),
              onChanged: (value) {},
            ));
        }
        
      },
    );
  }
}
