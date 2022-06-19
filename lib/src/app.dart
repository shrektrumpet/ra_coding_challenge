import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ra_coding_challenge/src/features/houses/repository/houses_repository.dart';
import 'package:ra_coding_challenge/src/services/got/retrofit/got_retrofit.dart';

import 'features/houses/cubit/houses_cubit.dart';
import 'localization/generated/l10n.dart';
import 'routing/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final retrofit = GotRetrofit(baseUrl: "https://www.anapioficeandfire.com");
    final houseRepository = HousesRepository(gotRetrofit: retrofit);

    return BlocProvider(
      create: (context) => HousesCubit(housesRepository: houseRepository),
      child: MaterialApp.router(
        routeInformationParser: goRouter.routeInformationParser,
        routerDelegate: goRouter.routerDelegate,
        localizationsDelegates: const [
          Localize.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: Localize.delegate.supportedLocales,
        onGenerateTitle: (context) => Localize.of(context).appTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      ),
    );
  }
}
