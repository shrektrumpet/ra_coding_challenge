import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';

import '../../../mocks.dart';

void main() {
  late MockGotRetrofit mockGotRetrofit;

  setUp(() {
    mockGotRetrofit = MockGotRetrofit();
  });

  group('getDetailedHouse', () {
    test('should return correct names from dtoHouse urls', () async {
      // setup
      when(() => mockGotRetrofit.getHouse("1")).thenAnswer(
        (_) => Future.value(dtoHouse1),
      );
      when(() => mockGotRetrofit.getCharacter("1")).thenAnswer(
        (_) => Future.value(dtoCharacter1),
      );
      final housesRepository = HousesRepository(gotRetrofit: mockGotRetrofit);
      // run
      final house = await housesRepository.getDetailedHouse("1");
      // verify
      expect(house.currentLordName == detailedHouse1.currentLordName, true);
      expect(house.heirName == detailedHouse1.heirName, true);
      expect(house.overlordName == detailedHouse1.overlordName, true);
      expect(house.founderName == detailedHouse1.founderName, true);
      expect(house.cadetBranchesNames?.first == detailedHouse1.cadetBranchesNames?.first, true);
      expect(house.swornMembersNames?.first == detailedHouse1.swornMembersNames?.first, true);
    });
  });

  group('getPageOfHouses', () {
    test('should return correct item count for one page', () async {
      // setup
      const expectedListLength = 5;
      when(() => mockGotRetrofit.getListOfHouses(1, 50)).thenAnswer(
        (_) => Future.value([dtoHouse1, dtoHouse1, dtoHouse1, dtoHouse1, dtoHouse1]),
      );
      final housesRepository = HousesRepository(gotRetrofit: mockGotRetrofit);
      // run
      final houses = await housesRepository.getPageOfHouses(1);
      // verify
      expect(houses.length == expectedListLength, true);
    });
  });
}
