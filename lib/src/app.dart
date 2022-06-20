import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/generated/l10n.dart';
import 'routing/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      localizationsDelegates: const [
        Localize.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: Localize.delegate.supportedLocales,
      onGenerateTitle: (context) => Localize.of(context).appTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
