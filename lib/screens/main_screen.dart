import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/series/series_screen.dart';

import '../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    SeriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
            child,
            primaryAnimation,
            secondaryAnimation,
            ) => FadeThroughTransition(
              fillColor: kBgCol,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
        ),
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: GNav(
        selectedIndex: pageIndex,
        onTabChange: (value){
          print(value);
          setState(() {
            pageIndex = value;
          });
        },
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: kBgCol,
        rippleColor: kTextLightColor,
        color: Colors.white,
        activeColor: kSecondaryColor,
        gap: kDefaultPadding/2,
        padding: EdgeInsets.all(kDefaultPadding),
        tabs: [
          GButton(
              icon: Icons.local_movies,
              text: 'Movies',
          ),
          GButton(
              icon: Icons.tv,
              text: 'Series',
          ),
        ],
      ),
    );
  }
}