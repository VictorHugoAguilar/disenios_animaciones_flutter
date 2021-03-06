import 'package:app_backgrounds_customs/src/models/layout_model.dart';
import 'package:app_backgrounds_customs/src/pages/launcher_tablet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:app_backgrounds_customs/src/pages/launcher_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
            create: (_) => new ThemeChanger(1)),
        ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel()),
      ],
      child: MyApp(),
    ),
  );
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => new ThemeChanger(1),
//       child: MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños de BackGrouds',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // return Container(
          //  child: LauncherPage(),
          // );

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
      //home: AnimacionesAnimateDoPage(),
    );
  }
}
