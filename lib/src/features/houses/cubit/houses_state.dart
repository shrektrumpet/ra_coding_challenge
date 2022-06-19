part of 'houses_cubit.dart';

@immutable
abstract class HousesState {}

class HousesInitial extends HousesState {}

class HousesLoading extends HousesState {}

class HousesLoaded extends HousesState {
  final List<House> houses;

  HousesLoaded({required this.houses});
}

class HouseLoaded extends HousesState {
  final House house;

  HouseLoaded({required this.house});
}

class HousesError extends HousesState {}
