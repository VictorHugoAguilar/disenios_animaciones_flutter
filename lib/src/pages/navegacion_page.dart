import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notificaciones'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottonNavigator(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pink,
        onPressed: () {
          final notiModel =
              Provider.of<_NotificationModel>(context, listen: false);

          int numero = notiModel.numero;
          numero++;
          notiModel.numero = numero;

          if (numero >= 2) {
            final controller = notiModel.bounceController;
            controller.forward(from: 0.0);
          }
        });
  }
}

class BottonNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificaciones = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone),
            // ignore: deprecated_member_use
            title: Text('Bones'),
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  // child: Icon(Icons.brightness_1,
                  //  size: 12, color: Colors.redAccent),
                  child: BounceInDown(
                    from: 10,
                    animate: (notificaciones > 0) ? true : false,
                    duration: Duration(milliseconds: 1000),
                    child: Bounce(
                      from: 10,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      child: Container(
                        child: Center(
                          child: Text(
                            '$notificaciones',
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                        ),
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ignore: deprecated_member_use
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog),
            // ignore: deprecated_member_use
            title: Text('My Dog'),
          ),
        ]);
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;

  AnimationController _bounceController;

  int get numero => this._numero;
  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController animationController) {
    this._bounceController = animationController;
    notifyListeners();
  }
}
