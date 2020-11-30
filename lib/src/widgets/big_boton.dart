import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigBoton extends StatelessWidget {
  final IconData icon;

  final String text;
  final Color colorPrimario;
  final Color colorSecundario;
  final Function onPress;

  const BigBoton({
    @required this.icon,
    @required this.text,
    this.colorPrimario = Colors.blueGrey,
    this.colorSecundario = Colors.grey,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BigBotonBackground(
            icon: this.icon,
            colorPrimario: this.colorPrimario,
            colorSecundario: this.colorSecundario,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                this.icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  this.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BigBotonBackground extends StatelessWidget {
  final IconData icon;
  final Color colorPrimario;
  final Color colorSecundario;

  const _BigBotonBackground({
    @required this.icon,
    @required this.colorPrimario,
    @required this.colorSecundario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -20,
                right: -20,
                child: FaIcon(
                  this.icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.colorPrimario,
            this.colorSecundario,
          ],
        ),
      ),
    );
  }
}
