import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(
      32.776665,
      -96.796989,
    ),
    zoom: 10.0,
  );

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
                if (state is GeolocationLoading){
                  return CircularProgressIndicator();
                }
                else if (state is GeolocationLoaded){
                  return Gmap(lat: state.position.latitude, lng: state.position.longitude);
                }
                else{
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
                  Expanded(child: locationsearchbox()),
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
        ));
  }
}
