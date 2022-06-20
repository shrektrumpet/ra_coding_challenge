import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';
import 'package:ra_coding_challenge/src/localization/string_hardcoded.dart';

import '../../cubits/detail_house/detail_house_cubit.dart';
import 'text_block.dart';

class DetailHouseView extends StatelessWidget {
  final String houseId;

  const DetailHouseView({Key? key, required this.houseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailHouseCubit(housesRepository: RepositoryProvider.of<HousesRepository>(context))
        ..getDetailedHouse(houseId),
      child: BlocBuilder<DetailHouseCubit, DetailHouseState>(builder: (context, state) {
        if (state is DetailHouseLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                TextBlock(
                  identifier: "name".hardcoded,
                  value: state.house.name,
                ),
                TextBlock(
                  identifier: "region".hardcoded,
                  value: state.house.region,
                ),
                TextBlock(
                  identifier: "coatOfArms".hardcoded,
                  value: state.house.coatOfArms,
                ),
                TextBlock(
                  identifier: "words".hardcoded,
                  value: state.house.words,
                ),
                TextBlock(
                  identifier: "titles".hardcoded,
                  value: state.house.titles.join("; "),
                ),
                TextBlock(
                  identifier: "seats".hardcoded,
                  value: state.house.seats.join("; "),
                ),
                TextBlock(
                  identifier: "currentLord".hardcoded,
                  value: state.house.currentLordName,
                ),
                TextBlock(
                  identifier: "heir".hardcoded,
                  value: state.house.heirName,
                ),
                TextBlock(
                  identifier: "overlord".hardcoded,
                  value: state.house.overlordName,
                ),
                TextBlock(
                  identifier: "founded".hardcoded,
                  value: state.house.founded,
                ),
                TextBlock(
                  identifier: "founder".hardcoded,
                  value: state.house.founderName,
                ),
                TextBlock(
                  identifier: "diedOut".hardcoded,
                  value: state.house.diedOut,
                ),
                TextBlock(
                  identifier: "ancestralWeapons".hardcoded,
                  value: state.house.ancestralWeapons.join("; "),
                ),
                TextBlock(
                  identifier: "cadetBranches".hardcoded,
                  value: state.house.cadetBranchesNames?.join("; "),
                ),
                TextBlock(
                  identifier: "swornMembers".hardcoded,
                  value: state.house.swornMembersNames?.join("; "),
                ),
              ],
            ),
          );
        }
        if (state is DetailHouseError) {
          return Text("error".hardcoded);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
