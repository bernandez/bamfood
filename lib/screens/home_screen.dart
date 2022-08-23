
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route(){
    return MaterialPageRoute(builder: (_) => HomeScreen(), settings: RouteSettings(name:routeName));
  }
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: SvgPicture.asset('assets/logo.svg',
        height: 100,),
      ),
    );
    
  }
}