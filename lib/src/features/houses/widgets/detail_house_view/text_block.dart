
import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final String identifier;
  final String? value;

  const TextBlock({Key? key, required this.identifier, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text("$identifier: ", style: theme.textTheme.headline6?.copyWith(color: theme.primaryColor)),
              Flexible(child: Text(value ?? "", style: theme.textTheme.headline6)),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
