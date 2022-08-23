
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/Location';

  static Route route(){
    return MaterialPageRoute(builder: (_) => LocationScreen(), settings: RouteSettings(name:routeName));
  }
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location")),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pushNamed(context,'/');
        }, child: Text("Home Screen")),
      ),
    );
    
  }
}