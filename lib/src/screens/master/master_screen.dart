import 'package:flutter/material.dart';

import '../../features/houses/widgets/houses_overview_list.dart';
import '../../localization/generated/l10n.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localize.of(context).masterScreenTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: HousesOverviewList(),
      ),
    );
  }
}
