import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListaViews(),
      //  body: _HeaderSliver(),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonFooter(),
          ),
        ],
      ),
    );
  }
}

class _BotonFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {},
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.accentColor
            : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(050),
          ),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            // color: Colors.white,
            color: appTheme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        // floating: true,
        // elevation: 0,
        // backgroundColor: Colors.red,
        // title: Text('Hola Mundo'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 170,
            maxheight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: _HeaderSliver(),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100,
            )
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minheight,
    @required this.maxheight,
    @required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  double get minExtent => (minheight > maxheight) ? maxheight : minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxExtent ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _HeaderSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// ignore: unused_element
class _ListaViews extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        this.titulo,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : this.color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
