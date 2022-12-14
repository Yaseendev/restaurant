part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapError extends MapState {
  @override
  List<Object?> get props => [];
}

class MapLoading extends MapState {
  @override
  List<Object?> get props => [];
}

class MapCurrentLocation extends MapState {
  final Position? curentLocation;
  MapCurrentLocation(this.curentLocation);

  @override
  List<Object?> get props => [curentLocation];
}

class MapServiceDisabled extends MapState {
  final bool forceUpdate;
  MapServiceDisabled(this.forceUpdate);
  @override
  List<Object?> get props => [forceUpdate];
}

class MapLocationChoosen extends MapState {
  final AddressLocation address;
  MapLocationChoosen(this.address);
  @override
  List<Object?> get props => [address];
}

class MapNoConnection extends MapState {
  @override
  List<Object?> get props => [];
}