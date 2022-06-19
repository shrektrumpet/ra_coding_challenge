import 'package:go_router/go_router.dart';
import 'package:ra_coding_challenge/src/screens/master/master_screen.dart';

import '../screens/details/detail_screen.dart';

enum AppRoute {
  master,
  detail,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.master.name,
      builder: (context, state) => const MasterScreen(),
      routes: [
        GoRoute(
          path: 'house/:id',
          name: AppRoute.detail.name,
          builder: (context, state) {
            final houseId = state.params['id']!;
            return DetailScreen(houseId: houseId);
          },
        ),
      ],
    ),
  ],
);
