import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:ra_coding_challenge/src/features/houses/models/house.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';

part 'houses_state.dart';

class HousesCubit extends Cubit<HousesState> {
  final HousesRepository housesRepository;

  HousesCubit({required this.housesRepository}) : super(HousesInitial());

  void getPageOfHouses(int page) async {
    emit(HousesLoading());
    try {
      final allHouses = await housesRepository.getPageOfHousesWithoutDetails(page);
      emit(HousesLoaded(houses: allHouses));
    } on Exception catch (e) {
      emit(HousesError());
    }
  }

  void getDetailedHouse(String houseId) async {
    emit(HousesLoading());
    try {
      final allHouse = await housesRepository.getDetailedHouse(houseId);
      emit(HouseLoaded(house: allHouse));
    } on Exception catch (e) {
      emit(HousesError());
    }
  }
}
