import 'package:ra_coding_challenge/src/services/got/retrofit/got_retrofit.dart';

import '../models/house.dart';

class HousesRepository {
  final GotRetrofit _gotRetrofit;

  HousesRepository({
    required GotRetrofit gotRetrofit,
  }) : _gotRetrofit = gotRetrofit;

  Future<List<House>> getPageOfHouses(int pageIndex) async {
    final List<House> allHouses = [];
    final pageOfDtoHouses = await _gotRetrofit.getListOfHouses(pageIndex, 50);
    for (var dtoHouse in pageOfDtoHouses) {
      allHouses.add(House.fromDtoHouse(dtoHouse));
    }
    return allHouses;
  }

  Future<House> getDetailedHouse(String houseId) async {
    final dtoHouse = await _gotRetrofit.getHouse(houseId);
    final house = House.fromDtoHouse(dtoHouse);

    final currentLordNameId = _getIdFromUrl(house.currentLordUrl);
    final heirNameId = _getIdFromUrl(house.heirUrl);
    final overlordNameId = _getIdFromUrl(house.overlordUrl);
    final founderNameId = _getIdFromUrl(house.founderUrl);
    final cadetBranchesNamesIds = house.cadetBranchesUrls.map((e) => _getIdFromUrl(e)).toList();
    final swornMembersNamesIds = house.swornMembersUrls.map((e) => _getIdFromUrl(e)).toList();

    final currentLordName = currentLordNameId.isEmpty ? "" : (await _gotRetrofit.getCharacter(currentLordNameId)).name;
    final heirName = heirNameId.isEmpty ? "" : (await _gotRetrofit.getCharacter(heirNameId)).name;
    final overlordName = overlordNameId.isEmpty ? "" : (await _gotRetrofit.getHouse(overlordNameId)).name;
    final founderName = founderNameId.isEmpty ? "" : (await _gotRetrofit.getCharacter(founderNameId)).name;
    final cadetBranchesNames = cadetBranchesNamesIds.isEmpty
        ? <String>[]
        : await Future.wait(cadetBranchesNamesIds.map((e) async {
            return (await _gotRetrofit.getHouse(e)).name;
          }).toList());
    final swornMembersNames = swornMembersNamesIds.isEmpty
        ? <String>[]
        : await Future.wait(swornMembersNamesIds.map((e) async {
            return (await _gotRetrofit.getCharacter(e)).name;
          }).toList());

    final detailedHouse = house.copyWith(
      currentLordName: currentLordName,
      heirName: heirName,
      overlordName: overlordName,
      founderName: founderName,
      cadetBranchesNames: cadetBranchesNames,
      swornMembersNames: swornMembersNames,
    );
    return detailedHouse;
  }

  String _getIdFromUrl(String url) {
    return url.split("/").last;
  }
}
