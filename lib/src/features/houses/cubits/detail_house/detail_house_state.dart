part of 'detail_house_cubit.dart';

@immutable
abstract class DetailHouseState {}

class DetailHouseInitial extends DetailHouseState {}

class DetailHouseLoading extends DetailHouseState {}

class DetailHouseLoaded extends DetailHouseState {
  final House house;

  DetailHouseLoaded({required this.house});
}

class DetailHouseError extends DetailHouseState {}
