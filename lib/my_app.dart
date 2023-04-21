import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'presentation/screen/index.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(colorShemaSeed: 1).getTheme(),
        title: 'Material App',
        home: const HomeScreen());
  }
}
