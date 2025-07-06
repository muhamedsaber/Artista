import 'dart:developer';
import 'dart:ui';

import 'package:artista/config/cache/cache_constants.dart';
import 'package:artista/config/cache/cache_helper.dart';
import 'package:artista/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const ArtistaApp());
}

class ArtistaApp extends StatelessWidget {
  const ArtistaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale("en"),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    log("${WidgetsBinding.instance.platformDispatcher.locale}");
    log("${Localizations.localeOf(context)}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).name,
        ),
      ),
    );
  }
}
