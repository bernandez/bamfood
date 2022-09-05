import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/places_autocomplete.dart';
import 'package:food_delivery_app/repositories/places/place_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscribtion;
  AutocompleteBloc({required PlacesRepository placesRepository}) : 
  _placesRepository = placesRepository,
  super(AutocompleteLoading()) {
    on<LoadAutocomplete>(_onLoadAutocomplete);
   
  }

  void _onLoadAutocomplete(
    LoadAutocomplete event,
    Emitter<AutocompleteState> emit,
  ) async {
    final List<PlaceComplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchinput);

    emit(AutocompleteLoaded(autocomplete: autocomplete));
  }
}
