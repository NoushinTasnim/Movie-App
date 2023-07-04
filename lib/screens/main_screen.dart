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
      backgroundColor: kBgCol,
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kBgCol,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            selectedIndex: pageIndex,
            onTabChange: (value){
              print(value);
              setState(() {
                pageIndex = value;
              });
            },
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Colors.transparent,
            rippleColor: kTextLightColor,
            color: Colors.white,
            activeColor: kSecondaryColor,
            gap: kDefaultPadding/2,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding/2),
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
        ),
      ),
    );
  }
}