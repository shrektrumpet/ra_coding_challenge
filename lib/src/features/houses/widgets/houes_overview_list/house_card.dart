import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/app_router.dart';
import '../../models/house.dart';

class HouseCard extends StatelessWidget {
  final House house;

  const HouseCard({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
