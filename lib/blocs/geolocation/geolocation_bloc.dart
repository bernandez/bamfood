import 'dart:async';
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
    on<LoadGeolocation>((event, emit) {
      emit(GeolocationLoading ());
      // TODO: implement event handler
    });

    // ignore: void_checks
    on<UpdateGeolocation>((event, emit) {
      emit(GeolocationLoaded(position: event.position));
      // ignore: todo
      // TODO: implement event handler
    });
    

  
}
Stream<GeolocationState> _mapLoadGeolocationToState() async*{
    _geolocationSubscription?.cancel();

    final Position position = await _geolocationRepository.getCurrentlocation();
    add(UpdateGeolocation(position: position));
  }

Stream<GeolocationState> _mapUpdateGeolocationToState(UpdateGeolocation event) async*{
  yield GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
