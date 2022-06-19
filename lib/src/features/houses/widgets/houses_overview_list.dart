import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ra_coding_challenge/src/features/houses/cubit/houses_cubit.dart';
import 'package:ra_coding_challenge/src/routing/app_router.dart';

import '../models/house.dart';

class HousesOverviewList extends StatefulWidget {
  const HousesOverviewList({Key? key}) : super(key: key);

  @override
  State<HousesOverviewList> createState() => _HousesOverviewListState();
}

class _HousesOverviewListState extends State<HousesOverviewList> {
  final List<House> houses = [];
  final controller = ScrollController();
  int loadedPages = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HousesCubit>(context).getPageOfHouses(loadedPages);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        loadedPages++;
        BlocProvider.of<HousesCubit>(context).getPageOfHouses(loadedPages);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HousesCubit, HousesState>(
      listener: (context, state) {
        if (state is HousesLoaded) {
          houses.addAll(state.houses);
        }
      },
      child: BlocBuilder<HousesCubit, HousesState>(
        builder: (context, state) {
          return ListView.builder(
            controller: controller,
            itemCount: houses.length + 1,
            itemBuilder: (context, index) {
              if (index < houses.length) {
                final house = houses[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          house.name,
                        ),
                        subtitle: Text(house.words),
                        onTap: () {
                          context.pushNamed(AppRoute.detail.name, params: {"id": house.url.split("/").last});
                        },
                      ),
                    ],
                  ),
                );
              } else {
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
      ),
    );
  }
}
