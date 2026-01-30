import 'package:flutter/material.dart';
import 'package:{{projectName.snakeCase()}}/core/app/i18n/translations.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('{{projectName.snakeCase()}}'),
      ),
      body: Center(child: Text(t.homeScreen.hello)),
    );
  }
}
