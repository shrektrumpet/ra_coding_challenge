import 'package:flutter/material.dart';
import 'package:ra_coding_challenge/src/widgets/dependency_provider.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DependencyProvider(child: App()));
}
