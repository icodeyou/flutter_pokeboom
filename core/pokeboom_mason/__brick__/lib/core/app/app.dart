import 'package:brickdance/core/app/i18n/translations.g.dart';
import 'package:brickdance/core/app/riverpod/riverpod_observers.dart';
import 'package:brickdance/core/app/routing/router.dart';
import 'package:brickdance/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [RiverpodObserver()],
      child: TranslationProvider(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appPrimary),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
