import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:ra_coding_challenge/src/features/houses/models/house.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';

part 'houses_state.dart';

class HousesCubit extends Cubit<HousesState> {
  final HousesRepository housesRepository;

  HousesCubit({required this.housesRepository}) : super(const HousesInitial(houses: [], pagesLoaded: 0));

  void getNextPageOfHouses() async {
    emit(HousesLoading(houses: state.houses, pagesLoaded: state.pagesLoaded));
    try {
      final pageOfHouses = await housesRepository.getPageOfHouses(state.pagesLoaded + 1);
      if (pageOfHouses.isEmpty) {
        emit(HousesLoadedAll(houses: state.houses, pagesLoaded: state.pagesLoaded));
      } else {
        emit(HousesLoadedPage(houses: [...state.houses, ...pageOfHouses], pagesLoaded: state.pagesLoaded + 1));
      }
    } on Exception catch (e) {
      emit(HousesError(houses: state.houses, pagesLoaded: state.pagesLoaded));
    }
  }
}
