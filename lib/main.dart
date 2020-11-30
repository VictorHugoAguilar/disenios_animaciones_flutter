import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:app_backgrounds_customs/src/pages/launcher_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños de BackGrouds',
      home: LauncherPage(),
    );
  }
}
