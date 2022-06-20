part of 'houses_cubit.dart';

@immutable
abstract class HousesState {
  final List<House> houses;
  final int pagesLoaded;

  const HousesState({required this.houses, required this.pagesLoaded});
}

class HousesInitial extends HousesState {
  const HousesInitial({required super.houses, required super.pagesLoaded});
}

class HousesLoading extends HousesState {
  const HousesLoading({required super.houses, required super.pagesLoaded});
}

class HousesLoadedPage extends HousesState {
  const HousesLoadedPage({required super.houses, required super.pagesLoaded});
}

class HousesLoadedAll extends HousesState {
  const HousesLoadedAll({required super.houses, required super.pagesLoaded});
}

class HousesError extends HousesState {
  const HousesError({required super.houses, required super.pagesLoaded});
}
