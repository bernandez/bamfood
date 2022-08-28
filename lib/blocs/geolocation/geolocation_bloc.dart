import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;
  
  GeolocationBloc({required GeolocationRepository geolocationRepository}) : 
   _geolocationRepository = geolocationRepository, 
  super(GeolocationLoading()) 
  {
    on<GeolocationEvent>((event, emit) {
      // _geolocationSubscription.cancel();

      // TODO: implement event handler
    });
  }
}
