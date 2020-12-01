import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:app_backgrounds_customs/src/pages/navegacion_page.dart';
import 'package:app_backgrounds_customs/src/pages/pagina2_animate_do.dart';
import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: FadeInDownBig(
          duration: Duration(milliseconds: 2000),
          child: Text('Animated_do'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Pagina2Page(),
                  ),
                );
              }),
          IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => Pagina1Page(),
                  ),
                );
              })
        ],
      ),
      floatingActionButton: ElasticInRight(
        duration: Duration(milliseconds: 2000),
        delay: Duration(milliseconds: 500),
        child: FloatingActionButton(
          backgroundColor: colorTheme.accentColor,
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => NavegacionPage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              duration: Duration(milliseconds: 4000),
              child: Icon(
                Icons.new_releases,
                color: colorTheme.accentColor,
                size: 40,
              ),
            ),
            FadeInDown(
              duration: Duration(milliseconds: 2000),
              delay: Duration(milliseconds: 2000),
              child: Text(
                'Titulo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            FadeInLeft(
              duration: Duration(milliseconds: 3000),
              child: Text(
                'Soy un texto pequeño',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FadeInRight(
              delay: Duration(milliseconds: 1000),
              child: Container(
                width: 220,
                height: 2,
                color: colorTheme.accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
