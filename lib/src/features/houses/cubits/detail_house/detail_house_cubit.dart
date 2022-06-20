import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../models/house.dart';
import '../../repository/houses_repository.dart';

part 'detail_house_state.dart';

class DetailHouseCubit extends Cubit<DetailHouseState> {
  final HousesRepository housesRepository;

  DetailHouseCubit({required this.housesRepository}) : super(DetailHouseInitial());

  void getDetailedHouse(String houseId) async {
    emit(DetailHouseLoading());
    try {
      final allHouse = await housesRepository.getDetailedHouse(houseId);
      emit(DetailHouseLoaded(house: allHouse));
    } on Exception catch (e) {
      emit(DetailHouseError());
    }
  }
}
