import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:app_backgrounds_customs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      body: HeaderWave(
        color: themeColor.accentColor,
      ),
    );
  }
}
