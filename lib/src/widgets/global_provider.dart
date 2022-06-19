import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ra_coding_challenge/src/features/houses/cubit/houses_cubit.dart';

import '../features/houses/repository/houses_repository.dart';
import '../services/got/retrofit/got_retrofit.dart';

class GlobalProvider extends StatelessWidget {
  final Widget child;

  const GlobalProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final retrofit = GotRetrofit(baseUrl: "https://www.anapioficeandfire.com");
    final housesRepository = HousesRepository(gotRetrofit: retrofit);

    return BlocProvider(
      create: (_) => HousesCubit(housesRepository: housesRepository),
      child: child,
    );
  }
}
