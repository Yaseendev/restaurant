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
  final Address address;
  MapLocationChoosen(this.address);
  @override
  List<Object?> get props => [address];
}

class MapLoaded extends MapState {
  final List<Branch> branches;
  final ByteData byteData;
  final int? index;
  MapLoaded({
    required this.branches,
    required this.byteData,
    this.index = 0,
  });

  @override
  List<Object?> get props => [branches,index];
}

class MapNoConnection extends MapState {
  @override
  List<Object?> get props => [];
}

class MapBranchSelected extends MapState {
  final Branch branch;
  final int index;
  const MapBranchSelected({
    required this.branch,
    required this.index,
  });

  @override
  List<Object?> get props => [branch, index];
}
