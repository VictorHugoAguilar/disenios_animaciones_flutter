import 'package:flutter/material.dart';
import 'package:app_backgrounds_customs/src/widgets/radial_progrees.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesageState createState() => _GraficasCircularesageState();
}

class _GraficasCircularesageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
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
                    porcentaje: porcentaje, color: Colors.pink),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.orange),
                CustomRadialProgress(
                    porcentaje: porcentaje, color: Colors.lightGreen),
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
    return Container(
      width: 180,
      height: 180,
      // color: Colors.purpleAccent,
      //child: Text('$porcentaje %', style: TextStyle(fontSize: 30.0))
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        anchoPrimario: 10,
        colorSecundario: Colors.lightBlue,
        anchoSecundario: 14,
      ),
    );
  }
}
