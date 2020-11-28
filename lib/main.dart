import 'package:flutter/material.dart';

import 'package:app_backgrounds_customs/src/pages/pinterest_page.dart';

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
      home: PinterestPage(),
    );
  }
}
