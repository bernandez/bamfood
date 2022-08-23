
import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(builder: (_) => VoucherScreen(), settings: RouteSettings(name:routeName));
  }
  const VoucherScreen({Key? key}) : super(key: key);

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