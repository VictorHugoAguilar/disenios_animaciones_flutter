import 'package:flutter/material.dart';
import 'package:app_backgrounds_customs/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
          backgroundColor: Colors.grey,
          // body: PinterestMenu(),
          body: Stack(
            children: <Widget>[
              PinterestGrid(),
              _PinterestMenuLocation(),
            ],
          )),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrarMenu = Provider.of<_MenuModel>(context).mostrarMenu;

    print('_PinterestMenuLocation $mostrarMenu');

    return Positioned(
      bottom: 30,
      child: Container(
        height: 100,
        width: widthPantalla,
        // color: Colors.red,
        child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(
            mostrarMenu: mostrarMenu,
            backgroundColor: Colors.blueAccent,
            activeColor: Colors.pinkAccent,
            inactiveColor: Colors.white,
            items: [
              PinterestButton(
                  icon: Icons.pie_chart, onPressed: () => print('pie_chart')),
              PinterestButton(
                  icon: Icons.search, onPressed: () => print('search')),
              PinterestButton(
                  icon: Icons.notifications,
                  onPressed: () => print('notifications')),
              PinterestButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () => print('supervised_user_circle')),
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> itemsCard = List.generate(200, (index) => index);
  ScrollController scrollController = new ScrollController();
  double scrollAnterior = 0.0;

  @override
  void initState() {
    scrollController.addListener(() {
      // print('Listener Scroll ${scrollController.offset}');

      if (scrollController.offset > scrollAnterior &&
          scrollController.offset > 150) {
        print('ocultar menu');
        Provider.of<_MenuModel>(context, listen: false).mostrarMenu = false;
      } else {
        print('mostrar menu');
        Provider.of<_MenuModel>(context, listen: false).mostrarMenu = true;
      }
      scrollAnterior = scrollController.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: itemsCard.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrarMenu = true;

  bool get mostrarMenu => this._mostrarMenu;
  set mostrarMenu(bool mostrar) {
    this._mostrarMenu = mostrar;
    notifyListeners();
  }
}
