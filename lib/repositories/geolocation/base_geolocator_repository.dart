import 'package:geolocator/geolocator.dart';


abstract class BaseGeolocationRepository{
  Future<Position?> getCurrentlocation() async {}
}