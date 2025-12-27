import 'package:brickdance/core/app/i18n/translations.g.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('brickdance'),
      ),
      body: Center(child: const Text(t.homeScreen.hello)),
    );
  }
}
