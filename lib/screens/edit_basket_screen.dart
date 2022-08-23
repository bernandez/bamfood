
import 'package:flutter/material.dart';

class EditBasketScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(builder: (_) => EditBasketScreen(), settings: RouteSettings(name:routeName));
  }
  const EditBasketScreen({Key? key}) : super(key: key);

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