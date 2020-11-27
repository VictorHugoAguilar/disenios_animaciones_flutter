import 'package:flutter/material.dart';
import 'package:app_backgrounds_customs/src/widgets/radial_progrees.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesageState createState() => _GraficasCircularesageState();
}

class _GraficasCircularesageState extends State<GraficasCircularesPage> {
  double porcentaje = 10.0;
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
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          // color: Colors.purpleAccent,
          //child: Text('$porcentaje %', style: TextStyle(fontSize: 30.0))
          child: RadialProgress(porcentaje: porcentaje),
        ),
      ),
    );
  }
}
