import 'package:flutter/material.dart';
import 'package:ra_coding_challenge/src/widgets/global_provider.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GlobalProvider(child: App()));
}
