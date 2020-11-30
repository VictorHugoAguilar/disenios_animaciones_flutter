import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:app_backgrounds_customs/src/widgets/radial_progrees.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesageState createState() => _GraficasCircularesageState();
}

class _GraficasCircularesageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje += 10;
              if (porcentaje > 100) {
                porcentaje = 0;
              }
            });
          },
          backgroundColor: appTheme.accentColor,
          child: Icon(Icons.refresh),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.purple),
                CustomRadialProgress(
                    porcentaje: porcentaje * 1.1, color: Colors.pink),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje * 1.3, color: Colors.orange),
                CustomRadialProgress(
                    porcentaje: porcentaje * 1.6, color: Colors.lightGreen),
              ],
            ),
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;
  final Color color;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      // color: Colors.purpleAccent,
      //child: Text('$porcentaje %', style: TextStyle(fontSize: 30.0))
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        anchoPrimario: 10,
        colorSecundario: appTheme.textTheme.bodyText1.color,
        anchoSecundario: 14,
      ),
    );
  }
}
