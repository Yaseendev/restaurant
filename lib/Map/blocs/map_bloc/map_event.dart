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
  final GeoLatLng position;
  ChooseLocation(this.position);

  @override
  List<Object> get props => [position];
}

class LoadMainMap extends MapEvent {
  @override
  List<Object> get props => [];
}

class GoToBranch extends MapEvent {
  final int index;
  const GoToBranch({
   required this.index,
    });

  @override
  List<Object> get props => [ index];
}
