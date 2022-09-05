import 'package:food_delivery_app/models/places_autocomplete.dart';
import 'package:food_delivery_app/repositories/places/base_places_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesRepository extends BasePlaceRepository{
  final String key='AIzaSyCKPzGYM9xLpV6gadg4-rsUdmXCwMyU-Ig';
  final String types='geocode';

  Future<List<PlaceComplete>> getAutocomplete(String searchinput) async{
     final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchinput&types=$types&key=$key';
     
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceComplete.fromJson(place)).toList();
  }
}