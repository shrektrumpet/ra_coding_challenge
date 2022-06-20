import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';

import '../../cubits/houses/houses_cubit.dart';
import 'house_card.dart';

class HousesOverviewList extends StatefulWidget {
  const HousesOverviewList({Key? key}) : super(key: key);

  @override
  State<HousesOverviewList> createState() => _HousesOverviewListState();
}

class _HousesOverviewListState extends State<HousesOverviewList> {
  final controller = ScrollController();
  late HousesCubit housesCubit;

  @override
  void initState() {
    super.initState();
    housesCubit = HousesCubit(housesRepository: RepositoryProvider.of<HousesRepository>(context));
    housesCubit.getNextPageOfHouses();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (housesCubit.state is HousesLoadedAll) return;
        housesCubit.getNextPageOfHouses();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    housesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HousesCubit, HousesState>(
      bloc: housesCubit,
      builder: (context, state) {
        final houses = state.houses;
        return ListView.builder(
          controller: controller,
          itemCount: houses.length + 1,
          itemBuilder: (context, index) {
            if (index < houses.length) {
              final house = houses[index];
              return HouseCard(house: house);
            } else {
              if (state is HousesLoadedAll) return const SizedBox();
              return const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
