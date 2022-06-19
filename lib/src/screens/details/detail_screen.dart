import 'package:flutter/material.dart';
import 'package:ra_coding_challenge/src/features/houses/widgets/detail_house_view/detail_house_view.dart';

import '../../localization/generated/l10n.dart';

class DetailScreen extends StatelessWidget {
  final String houseId;

  const DetailScreen({Key? key, required this.houseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localize.of(context).detailScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DetailHouseView(
          houseId: houseId,
        ),
      ),
    );
  }
}
