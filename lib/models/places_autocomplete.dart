import 'dart:convert';

class PlaceComplete{
  final String description;
  final String placeid;

   PlaceComplete({required this.description, required this.placeid});
   factory PlaceComplete.fromJson(Map<String, dynamic> json){
    return PlaceComplete(
      description: json['description'], 
      placeid: json['place_id'] );
   }
   
} 