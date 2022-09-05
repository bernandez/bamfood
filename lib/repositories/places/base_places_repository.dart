import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/places_autocomplete.dart';

abstract class BasePlaceRepository{
  Future<List<PlaceComplete>?> getAutocomplete(String serachinput) async{}
}