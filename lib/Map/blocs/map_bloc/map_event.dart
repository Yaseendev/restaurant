part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrentLocation extends MapEvent {
  @override
  List<Object> get props => [];
}

class ChooseLocation extends MapEvent {
  final LatLng position;
  ChooseLocation(this.position);

  @override
  List<Object> get props => [position];
}
