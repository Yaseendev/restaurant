part of 'initroute_bloc.dart';

abstract class InitrouteState extends Equatable {
  const InitrouteState();

  @override
  List<Object> get props => [];
}

class InitrouteInitial extends InitrouteState {}

class InitrouteError extends InitrouteState {
  @override
  List<Object> get props => [];
}

class InitrouteNoLocation extends InitrouteState {
  @override
  List<Object> get props => [];
}

class InitrouteProceed extends InitrouteState {
  @override
  List<Object> get props => [];
}

class InitrouteNoInternet extends InitrouteState {
  @override
  List<Object> get props => [];
}

