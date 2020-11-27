import 'package:app_backgrounds_customs/src/labs/circular_progress_page.dart';
import 'package:app_backgrounds_customs/src/pages/graficas_circulares_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños de BackGrouds',
      home: GraficasCircularesPage(),
    );
  }
}
