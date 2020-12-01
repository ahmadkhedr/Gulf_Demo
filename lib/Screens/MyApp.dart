import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gulf_demo/Screens/FavouritesScreen.dart';
import 'package:gulf_demo/Screens/MainScreen.dart';
import 'package:gulf_demo/Screens/MyProfileScreen.dart';
import 'package:gulf_demo/Screens/PastAdScreen.dart';
import 'package:gulf_demo/Screens/SettingsScreen.dart';
import 'package:gulf_demo/Style/SizeConfig.dart';

class Myapp extends StatefulWidget {
  @override
  _viewMthodsPageState createState() => _viewMthodsPageState();
}

class _viewMthodsPageState extends State<Myapp> with SingleTickerProviderStateMixin{
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  final List<Widget> _children = [
    new MainScreen(),
    new PostAdScreen(),
    new MyProfileScreen(),
    new FavouritesScreen(),
    new SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          bottomNavigationBar: BottomBar(context),
          body: _children[_cIndex],
        ));
  }

  Widget BottomBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _cIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF086B1F),
      unselectedItemColor: Color(0xFFA9A9A9),
      items: [
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.home_outlined, /*color: Colors.black45*/
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.add_photo_alternate_outlined, /*color: Colors.black45*/
          ),
          label: "Post Ad",
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.person_outline, /*color: Colors.black45*/
          ),
          label: "My Profile",
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.favorite_border, /*color: Colors.black45*/
          ),
          label: "Favourite",
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.settings_outlined, /*color: Colors.black45*/
          ),
          label: "Settings",
        ),
      ],
      onTap: (index) {
        _incrementTab(index);
      },
    );
  }
}
