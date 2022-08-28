import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/repositories/geolocation/base_geolocator_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository extends BaseGeolocationRepository{

  GeolocationRepository();

  @override
  Future<Position> getCurrentlocation() async{
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

}