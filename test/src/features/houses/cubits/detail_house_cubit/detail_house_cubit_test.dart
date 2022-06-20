import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ra_coding_challenge/src/features/houses/cubits/detail_house/detail_house_cubit.dart';

import '../../../../mocks.dart';

main() {
  late MockHousesRepository mockHousesRepository;

  setUp(() {
    mockHousesRepository = MockHousesRepository();
  });

  group('DetailHouseCubit', () {
    blocTest<DetailHouseCubit, DetailHouseState>(
      'emits [] when nothing is called',
      build: () => DetailHouseCubit(housesRepository: mockHousesRepository),
      expect: () => <DetailHouseState>[],
    );

    blocTest<DetailHouseCubit, DetailHouseState>(
      'emits Loading and Loaded state when called successfully',
      build: () => DetailHouseCubit(housesRepository: mockHousesRepository),
      setUp: () {
        when(() => mockHousesRepository.getDetailedHouse("1")).thenAnswer(
          (_) => Future.value(detailedHouse1),
        );
      },
      act: (cubit) => cubit.getDetailedHouse("1"),
      expect: () => [isA<DetailHouseLoading>(), isA<DetailHouseLoaded>()],
    );
    blocTest<DetailHouseCubit, DetailHouseState>(
      'emits Loading and Error state when call throws exception',
      build: () => DetailHouseCubit(housesRepository: mockHousesRepository),
      setUp: () {
        when(() => mockHousesRepository.getDetailedHouse("1")).thenAnswer(
          (_) => throw Exception(),
        );
      },
      act: (cubit) => cubit.getDetailedHouse("1"),
      expect: () => [isA<DetailHouseLoading>(), isA<DetailHouseError>()],
    );
  });
}
