import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool mostrarMenu;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.mostrarMenu = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.pink,
      this.inactiveColor = Colors.grey,
      @required this.items});

/*
  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('pie_chart');
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('search');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('notifications');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('supervised_user_circle');
        }),
  ];
*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrarMenu) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(1, 1),
              blurRadius: 10.0,
              spreadRadius: -5,
            )
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuButton(index: index, item: menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({this.index, this.item});

  @override
  Widget build(BuildContext context) {
    final _MenuModel menuModel = Provider.of<_MenuModel>(context);
    final bool seleccionado = (menuModel.itemSeleccionado == index);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: seleccionado ? 35 : 25,
          color: seleccionado ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.pink;
  Color _inactiveColor = Colors.grey;

  get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  get backgroundColor => this._backgroundColor;
  set backgroundColor(Color color) {
    this._backgroundColor = color;
  }

  get activeColor => this._activeColor;
  set activeColor(Color color) {
    this._activeColor = color;
  }

  get inactiveColor => this._inactiveColor;
  set inactiveColor(Color color) {
    this._inactiveColor = color;
  }
}
