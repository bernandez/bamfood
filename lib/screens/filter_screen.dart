
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(builder: (_) => FilterScreen(), settings: RouteSettings(name:routeName));
  }
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pushNamed(context,'/Location');
        }, child: Text("Location Screen")),
      ),
    );
    
  }
}