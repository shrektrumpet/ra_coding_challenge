import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/houses/repository/houses_repository.dart';
import '../services/got/retrofit/got_retrofit.dart';

class DependencyProvider extends StatelessWidget {
  final Widget child;

  const DependencyProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final retrofit = GotRetrofit(baseUrl: "https://www.anapioficeandfire.com");

    return RepositoryProvider(
      create: (_) => HousesRepository(gotRetrofit: retrofit),
      child: child,
    );
  }
}
